//
//  ScreenViewController.m
//  FanMovies
//
//  Created by qianfeng on 15/10/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ScreenViewController.h"

#define TOP_TAG 200
#define CONTENT_TAG 201

#import "Interface.h"
#import "AFNetworking.h"
#import "ZJModelTool.h"

#import "ScreenModel.h"
#import "MovieData.h"
#import "MovieCell.h"
#import "NSString+Frame.h"
#import "ScreenTableView.h"

@interface ScreenViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    int _page;
}

@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic,strong) NSMutableArray *buttonArray;
@property (nonatomic) NSMutableArray *tabViewArray;

@end

@implementation ScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _page = 1;
    
    _buttonArray = [NSMutableArray array];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self createTopScrollView];
    [self createContentScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建包含tableView的滚动视图
- (void)createContentScrollView
{
    _contentScrollView.delegate = self;
    _contentScrollView.tag = CONTENT_TAG;
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView.pagingEnabled = YES;
    
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat W = self.contentScrollView.frame.size.width;
    CGFloat H = self.contentScrollView.frame.size.height;
    
    for(int i=0;i<self.buttonArray.count;i++)
    {
        ScreenTableView *tableView = [[ScreenTableView alloc] initWithFrame:CGRectMake( X, Y, W, H)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tag = i;
        
        [self.contentScrollView addSubview:tableView];
        
        tableView.urlString = [NSString stringWithFormat:SCREEN_URL,i+1,_page];
        
        X +=W;
    }
    
    _contentScrollView.contentSize = CGSizeMake(self.contentScrollView.frame.size.width*_buttonArray.count, 0);
    [self contentScrollViewShowPage:0];
}
- (void)contentScrollViewShowPage:(int)page
{
    [_contentScrollView setContentOffset:CGPointMake(page * _contentScrollView.frame.size.width, 0) animated:YES];
}

#pragma mark - 创建头部的滚动视图
- (void)createTopScrollView
{
    _topScrollView.delegate = self;
    _topScrollView.tag = TOP_TAG;
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.showsVerticalScrollIndicator = NO;
    
    NSArray *title = @[@"正在上映",@"即将上映"];
    for(int i=0;i<title.count;i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title[i] forState:UIControlStateNormal];
        [self.topScrollView addSubview:button];
        button.frame = CGRectMake(i*(self.topScrollView.frame.size.width/2), 0, self.topScrollView.frame.size.width/2, self.topScrollView.frame.size.height);
        button.tag = i+100;
        [button addTarget:self action:@selector(dealClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttonArray addObject:button];
    }
    _topScrollView.contentSize = CGSizeMake(self.topScrollView.frame.size.width, self.topScrollView.frame.size.height);
    [self topScrollViewShowPage:0];
}
- (void)dealClick:(UIButton *)button
{
    int page = (int)button.tag - 100;
    [self topScrollViewShowPage:page];
    [self contentScrollViewShowPage:page];
}

- (void)topScrollViewShowPage:(int)page
{
    for (UIButton *button in _buttonArray)
    {
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    UIButton *selectButton = _buttonArray[page];
    [selectButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
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
- (IBAction)BackButtonClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - tableview
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScreenTableView *tab = (ScreenTableView *)tableView;
    ScreenModel *model = tab.dataArray[indexPath.row];
    CGFloat contentWidth = self.view.frame.size.width-193-24;
    CGFloat subjectHeight = [model.subject heightWithFont:[UIFont systemFontOfSize:15] withinWidth:contentWidth];
    CGFloat pubdateHeight = [model.movData.pubdate heightWithFont:[UIFont systemFontOfSize:15] withinWidth:contentWidth];
    CGFloat directorsHeight = [model.movData.directors heightWithFont:[UIFont systemFontOfSize:15] withinWidth:contentWidth];
    CGFloat castsHeight = [model.movData.casts heightWithFont:[UIFont systemFontOfSize:15] withinWidth:contentWidth];
    CGFloat messageHeight = [model.message heightWithFont:[UIFont systemFontOfSize:17] withinWidth:contentWidth];
    return 300-4*18-21+subjectHeight+pubdateHeight+directorsHeight+castsHeight+messageHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ScreenTableView *tab = (ScreenTableView *)tableView;
    return tab.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScreenTableView *tabView = (ScreenTableView *)tableView;
    MovieCell *cell = [MovieCell movieCell:tabView];
    cell.data = tabView.dataArray[indexPath.row];
    return cell;
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
