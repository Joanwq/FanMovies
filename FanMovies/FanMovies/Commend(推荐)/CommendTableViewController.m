//
//  CommendTableViewController.m
//  FindMovies
//
//  Created by qianfeng on 15/10/26.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "CommendTableViewController.h"

#import "AFNetworking.h"
#import "ZJModelTool.h"
#import "Interface.h"

#import "ScreenViewController.h"
#import "ShortStoryViewController.h"
#import "MovieListViewController.h"
#import "HeaderView.h"
#import "CellFactory.h"
#import "CellHeight.h"
#import "HeaderView.h"
#import "CommendModel.h"
#import "ExplorerbannerlistModel.h"
#import "ExplorerhotkeywordlistModel.h"
#import "ListModel.h"

@interface CommendTableViewController ()<UITableViewDataSource,UITableViewDelegate,HeaderViewButtonClickDelegate>
{
    int _page;
}
@property (nonatomic,weak) HeaderView *headerView;
@end

@implementation CommendTableViewController

- (void)viewDidLoad {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    self.cachePath = [paths[0] stringByAppendingPathComponent:@"funny2.json"];
    _page = 1;
    self.url = [NSString stringWithFormat:COMMEND_URL,_page];
    
    [super viewDidLoad];
    //设置刷新类型
    self.refreshType = RefreshTypeAll;
    //下载数据
    [self loadData];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    HeaderView *headerView = [HeaderView headView];
    self.tableView.tableHeaderView = headerView;
    self.headerView = headerView;
    headerView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 刷新

- (void)footerRefresh
{
    _page++;
    [self loadData];
}

#pragma mark - 下载数据
- (void)loadData
{
    NSString *url = [NSString stringWithFormat:COMMEND_URL,_page];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *rootDict = dict[@"data"];
        CommendModel *model = [[CommendModel alloc] init];
        [model setValuesForKeysWithDictionary:rootDict];
        
        NSArray *explorerbannerlistArr = rootDict[@"explorerbannerlist"];
        for(NSDictionary *dataDict in explorerbannerlistArr)
        {
            ExplorerbannerlistModel *model = [[ExplorerbannerlistModel alloc] init];
            [model setValuesForKeysWithDictionary:dataDict];
            [self.explorerbannerlistArrM addObject:model];
        }
        self.headerView.dataArray = self.explorerbannerlistArrM;
        
        NSArray *explorerhotkeywordlistArr = rootDict[@"explorerhotkeywordlist"];
        for(NSDictionary *dataDict in explorerhotkeywordlistArr)
        {
            ExplorerhotkeywordlistModel *model = [[ExplorerhotkeywordlistModel alloc] init];
            [model setValuesForKeysWithDictionary:dataDict];
            [self.explorerhotkeywordlistArrM addObject:model];
        }
        
        NSArray *listArr = rootDict[@"list"];
        for(NSDictionary *dataDict in listArr)
        {
            NSString *type = dataDict[@"type"];
            NSDictionary *itemDict = dataDict[@"itemdata"];
            ListModel *model = [[ListModel alloc] init];
            model.type = type;
            [model setValuesForKeysWithDictionary:itemDict];
            [self.listArrM addObject:model];
        }
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self endFooterRefresh];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArrM.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CellHeight cellHeightWithListModel:self.listArrM[indexPath.row] tableView:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CellFactory cellFactoryWithListModel:self.listArrM[indexPath.row] tableView:tableView];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - 四个主要的button跳转
- (void)screenButtonClickWithHeaderView:(HeaderView *)headerView button:(UIButton *)button
{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ScreenViewController *screenViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ScreenID"];
    [self.navigationController pushViewController:screenViewController animated:YES];
}
- (void)shortStoryButtobClickHeaderView:(HeaderView *)headerView button:(UIButton *)button
{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ShortStoryViewController *shortStoryViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"ShortStoryID"];
    [self.navigationController pushViewController:shortStoryViewController animated:YES];
}
- (void)moviesListButtonClcikHeaderView:(HeaderView *)headerView button:(UIButton *)button
{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MovieListViewController *movielistViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"MovieListID"];
    [self.navigationController pushViewController:movielistViewController animated:YES];
}
- (void)moreButtonClickHeaderView:(HeaderView *)headerView button:(UIButton *)button
{
    [_delegate moreButtonClickWithViewController:self button:button];
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
