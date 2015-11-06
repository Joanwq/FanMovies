//
//  MainNavigationViewController.m
//  FindMovies
//
//  Created by qianfeng on 15/10/26.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "MainNavigationViewController.h"

#define TOP_TAG 200
#define CONTENT_TAG 201

#import "SettingTableViewController.h"
#import "MineTableViewController.h"
#import "CommendTableViewController.h"
#import "FindTableViewController.h"
#import "SearchTableViewController.h"

@interface MainNavigationViewController ()<UIScrollViewDelegate,CommendTableViewControllerDelegate>
{
    NSMutableArray *_titleLableArray;
}
@property (strong,nonatomic) NSArray *ViewControllers;
@property (nonatomic,strong) UIScrollView *contentScrollView;
@property (nonatomic,strong) UIScrollView *titleScrollView;

@end

@implementation MainNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self createContentView];
    
    [self createTitleView];
    
    [self createLeftView];
    
    [self createRightView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 创建导航栏的viewControllers的View
- (void)createContentView
{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MineTableViewController *mineTableViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MineID"];
    
    CommendTableViewController *commendTableViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"CommendID"];
    commendTableViewController.delegate = self;
    
    FindTableViewController *findTableViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"FindID"];
    
    NSArray *viewControllers = @[mineTableViewController,commendTableViewController,findTableViewController];
    [self createContentViewWithArray:viewControllers];
    self.ViewControllers = viewControllers;
}

- (void)createContentViewWithArray:(NSArray *)viewControllers
{
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:backView];
    _contentScrollView = [[UIScrollView alloc] initWithFrame:backView.bounds];
    [backView addSubview:_contentScrollView];
    
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.tag = CONTENT_TAG;
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView.delegate = self;
    
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat W = _contentScrollView.frame.size.width;
    CGFloat H = _contentScrollView.frame.size.height;
    
    for(int i=0;i<viewControllers.count;i++)
    {
        UIViewController *vc = viewControllers[i];
        vc.view.frame = CGRectMake( X, Y, W, H);
        
        [_contentScrollView addSubview:vc.view];
        
        //将子类添加到父类控制器
        [self addChildViewController:vc];
        X += W;
    }
    _contentScrollView.contentSize = CGSizeMake(_contentScrollView.frame.size.width*viewControllers.count, 0);
    
    //显示第0页
    [self contentScrollViewShowPage:1];
}

-(void)contentScrollViewShowPage:(int)page
{
    [_contentScrollView setContentOffset:CGPointMake(page * _contentScrollView.frame.size.width, 0) animated:YES];
}

#pragma mark - 创建导航栏的titleView
- (void)createTitleView
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 30)];
//    titleView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = titleView;
    
    _titleScrollView = [[UIScrollView alloc] initWithFrame:titleView.bounds];
    [titleView addSubview:_titleScrollView];
    _titleScrollView.tag = TOP_TAG;
    _titleScrollView.showsHorizontalScrollIndicator = NO;
    _titleScrollView.showsVerticalScrollIndicator = NO;
    _titleScrollView.delegate = self;
    
    CGFloat titleLabelWidth = titleView.frame.size.width/_ViewControllers.count-10;
    _titleLableArray = [[NSMutableArray alloc] init];
    for (int i=0; i<_ViewControllers.count; i++) {
        UIViewController *vc = _ViewControllers[i];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(titleLabelWidth * i, 0, titleLabelWidth, titleView.frame.size.height)];
        
        label.text = vc.navigationItem.title;
        label.userInteractionEnabled = YES;
        label.tag = i+100;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        
        label.textAlignment = NSTextAlignmentCenter;
        [_titleLableArray addObject:label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
        [label addGestureRecognizer:tap];
        [_titleScrollView addSubview:label];
    }
    _titleScrollView.contentSize = CGSizeMake(titleLabelWidth*_ViewControllers.count, titleView.frame.size.height-20);
    
    [self topScrollViewShowPage:1];
}
-(void)dealTap:(UITapGestureRecognizer *)tap
{
    int page = (int)tap.view.tag - 100;
    [self topScrollViewShowPage:page];
    [self contentScrollViewShowPage:page];
}
-(void)topScrollViewShowPage:(int)page
{
    for (UILabel *label in _titleLableArray) {
        label.textColor = [UIColor blackColor];
    }
    UILabel *selectLabel = _titleLableArray[page];
    selectLabel.textColor = [UIColor redColor];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.tag == CONTENT_TAG)
    {
        //注意0除
        int page = scrollView.contentOffset.x / self.view.frame.size.width;
        [self topScrollViewShowPage:page];
    }
}

#pragma  mark - 创建导航栏左边的视图
- (void)createLeftView
{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    leftButton.clipsToBounds = YES;
    [leftButton setBackgroundImage:[UIImage imageNamed:@"user-grey"] forState:UIControlStateNormal];
    leftButton.layer.cornerRadius = 15;
    [leftButton addTarget:self action:@selector(dealLeftButtonClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)dealLeftButtonClick
{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SettingTableViewController *svc = [mainStoryboard instantiateViewControllerWithIdentifier:@"SettingID"];
    svc.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:svc animated:YES];
}

#pragma mark - 创建导航栏右边的视图
- (void)createRightView
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    rightButton.frame = CGRectMake(0, 0, 25, 25);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"search_d"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(dealRightButtonClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)dealRightButtonClick
{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchTableViewController *svc = [mainStoryboard instantiateViewControllerWithIdentifier:@"SearchID"];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)moreButtonClickWithViewController:(UIViewController *)viewController button:(UIButton *)button
{
    NSLog(@"---------");
    [self topScrollViewShowPage:2];
    [self contentScrollViewShowPage:2];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
