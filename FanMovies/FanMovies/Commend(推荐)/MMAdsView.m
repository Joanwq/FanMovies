//
//  MMAdsView.m
//  AdsViewDemo
//
//  Created by qianfeng on 15/10/22.
//  Copyright © 2015年 cherry. All rights reserved.
//

#import "MMAdsView.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "UIImage+MultiFormat.h"


@interface MMAdsView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property(nonatomic)NSMutableArray *imgViewArr;

@property(nonatomic)NSTimer *timer;

@end

@implementation MMAdsView

+ (id)mmAdsViewWithFrame:(CGRect)frame
{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"MMAdsView" owner:nil options:nil] firstObject];
    view.frame = frame;
    return view;
}

- (void)awakeFromNib
{
    self.scrollDelay = 0.3;
    self.scrollInterval = 2;
    self.titleColor = [UIColor grayColor];
    [self.titleLabel sizeToFit];
    
}


#pragma mark - 数据之间转换
- (void)setImgUrlArray:(NSArray *)imgUrlArray
{
    _imgUrlArray = imgUrlArray;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:imgUrlArray.count];
    
    for (int i = 0; i<imgUrlArray.count; i++) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectZero];
        [imageview setImageWithURL:[NSURL URLWithString:imgUrlArray[i]]];
        [array addObject:imageview.image];
    }
    self.imgArray = array;
}

#pragma mark - 添加imgs
- (void)setImgArray:(NSArray *)imgArray
{
    _imgArray = imgArray;
    
    self.imgViewArr = [[NSMutableArray alloc]init];
    
    if (imgArray.count == 1) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [imageView setImage:[UIImage imageNamed:imgArray[0]]];
        [self.scrollView addSubview:imageView];
        self.scrollView.contentSize = self.scrollView.frame.size;
        return;
    }
    
    //添加imgview
    float x = self.frame.size.width;
    for (int i = 0; i<imgArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, 0, self.frame.size.width, self.frame.size.height)];
        [imageView setImage:[UIImage imageNamed:imgArray[i]]];
        [self.scrollView addSubview:imageView];
        
        [self.imgViewArr addObject:imageView];
        
        x += self.frame.size.width;
    }
    
    //add the end to first
    UIImageView *headview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [headview setImage:[UIImage imageNamed:imgArray[imgArray.count-1]]];
    [self.scrollView addSubview:headview];
    
    [self.imgViewArr addObject:headview];
    
    
    //add the first to end
    UIImageView *footerview = [[UIImageView alloc]initWithFrame:CGRectMake(x, 0, self.frame.size.width, self.frame.size.height)];
    [footerview setImage:[UIImage imageNamed:imgArray[0]]];
    [self.scrollView addSubview:footerview];
    
    [self.imgViewArr addObject:footerview];
    
    
    //config
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces =NO;
    
    self.pageController.numberOfPages = imgArray.count;
    self.pageController.currentPage = 0;
    
    self.scrollView.contentSize = CGSizeMake(x + self.frame.size.width, self.frame.size.height);
    
    //1、把起始页面设为第二页
    self.scrollView.contentOffset = CGPointMake(self.frame.size.width, 0);
}

#pragma mark - 添加每页页面不一样的title
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    
    self.titleLabel.textColor = self.titleColor;
    
    #pragma mark 配置每一页不一样的title
    if (self.titleArray.count==0){
        return;
    }else if (self.titleArray.count == 1){
        self.titleLabel.text = self.titleArray[0];
        return;
    }
        
    int i = 0;
    while (i<self.imgViewArr.count) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y, 200, 21)];
        label.textColor = self.titleColor;
        if (i==self.imgViewArr.count-1) {
            label.text = self.titleArray[0];
        }
        else if (i==self.imgViewArr.count-2){
            label.text = self.titleArray[self.titleArray.count-1];
        }else{
            label.text = self.titleArray[i];
        }
        UIView *view = self.imgViewArr[i];
        NSLog(@"label:%@  %@",label.text,NSStringFromCGSize(label.frame.size));
        [view addSubview:label];
        [label sizeToFit];
        i++;
    }
    
    self.titleLabel.hidden = YES;

}


#pragma mark - timer控制
- (void)startTimer
{
    if (self.imgArray.count == 1)
        return;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollInterval target:self selector:@selector(dealAutoScroll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self startTimer];
}


#pragma mark - 自动滚动的时候，处理循环滚动
//因为自动滚动只按一个方向，所以单独配置他的循环滚动也行
- (void)dealAutoScroll{
    
    //先滚动
    [UIView animateWithDuration:self.scrollDelay animations:^{
        self.scrollView.contentOffset = CGPointMake((self.pageController.currentPage + 2) * self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
    }];
    
    //共4张图 0-3
    //处理pagecontroller 0-2滚过来的图
    if (self.pageController.currentPage < self.imgArray.count-1) {
        self.pageController.currentPage ++;
        
    }
    //处理3滚过来的图
    else if (self.pageController.currentPage == self.imgArray.count-1){
        self.pageController.currentPage = 0;
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
        
    }
}

#pragma mark - 手动滚动的时候，处理循环滚动
//2、随contentoffset修改相应参数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = self.scrollView.contentOffset.x / self.frame.size.width;
    
    //first to last
    if (index == 0) {
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * (self.imgArray.count), self.scrollView.contentOffset.y);
        self.pageController.currentPage = self.imgArray.count-1;
    }
    //last to first
    else if (index == self.imgArray.count+1){
        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
        self.pageController.currentPage = 0;
    }
    //nomal
    else{
        self.pageController.currentPage = index-1;
    }
}


@end
