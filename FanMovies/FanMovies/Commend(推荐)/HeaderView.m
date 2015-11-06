//
//  HeaderView.m
//  FindMovies
//
//  Created by qianfeng on 15/10/28.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "HeaderView.h"

#import "Masonry.h"
//#import "ZJScreenAdaptaionMacro.h"
//#import "ZJScreenAdaptation.h"
#import "UIImageView+WebCache.h"
#import "ExplorerbannerlistModel.h"
#import "ScreenViewController.h"

@interface HeaderView()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *headerScrollView;
@property (weak, nonatomic) IBOutlet UIButton *screenButton;
@property (weak, nonatomic) IBOutlet UIButton *shortStoryButton;
@property (weak, nonatomic) IBOutlet UIButton *movieListButton;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end

@implementation HeaderView

- (void)awakeFromNib
{
    [self.screenButton addTarget:self action:@selector(screenButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.shortStoryButton addTarget:self action:@selector(shortStoryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.movieListButton addTarget:self action:@selector(movieListButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 点击跳转
- (void)screenButtonClick:(UIButton *)button
{
    [_delegate screenButtonClickWithHeaderView:self button:button];
}
- (void)shortStoryButtonClick:(UIButton *)button
{
    [_delegate shortStoryButtobClickHeaderView:self button:button];
}
- (void)movieListButtonClick:(UIButton *)button
{
    [_delegate moviesListButtonClcikHeaderView:self button:button];
}
- (void)moreButtonClick:(UIButton *)button
{
    NSLog(@"&&&&&&&");
    [_delegate moreButtonClickHeaderView:self button:button];
}
#pragma mark - 初始化
+ (id)headView
{
    return  [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] lastObject];
}

#pragma mark - 设置控件内容
- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
//    _imageArray = [NSMutableArray array];
    self.headerScrollView.pagingEnabled = YES;
    self.headerScrollView.showsHorizontalScrollIndicator = NO;
    self.headerScrollView.delegate = self;
    
    float X = 0;
    for(int i=0;i<dataArray.count;i++)
    {
        
        ExplorerbannerlistModel *model = dataArray[i];
        UIImageView *images = [[UIImageView alloc] initWithFrame:CGRectMake(X, 0, self.headerScrollView.frame.size.width, 150)];
        [self.headerScrollView addSubview:images];
        NSString *imageUrl = [NSString stringWithFormat:@"http://morguo.com/%@",model.image];
        [images sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
//        [_imageArray addObject:imageUrl];
        X+=self.headerScrollView.frame.size.width;
    }
    self.headerScrollView.contentSize = CGSizeMake(self.headerScrollView.frame.size.width*dataArray.count, 140);
    self.headerScrollView.bounces =NO;
    
//    [self setArray];
//    self.pageController.numberOfPages = dataArray.count;
//    self.pageController.currentPage = 0;
//    [self startTimer];
}
//- (void)setArray
//{
//    _imageArray = [NSMutableArray array];
//    [_imageArray addObject:self.dataArray.]
//}
//- (void)startTimer
//{
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dealAutoScroll) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//}
//- (void)stopTimer
//{
//    [self.timer invalidate];
//    self.timer = nil;
//}
//- (void)dealAutoScroll{
//    
//    //先滚动
//    [UIView animateWithDuration:self.scrollDelay animations:^{
//        self.scrollView.contentOffset = CGPointMake((self.pageController.currentPage + 2) * self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
//    }];
//    
//    //共4张图 0-3
//    //处理pagecontroller 0-2滚过来的图
//    if (self.pageController.currentPage < self.imgArray.count-1) {
//        self.pageController.currentPage ++;
//        
//    }
//    //处理3滚过来的图
//    else if (self.pageController.currentPage == self.imgArray.count-1){
//        self.pageController.currentPage = 0;
//        self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
//        
//    }
//}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
