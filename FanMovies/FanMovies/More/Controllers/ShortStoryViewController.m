//
//  ShortStoryViewController.m
//  FanMovies
//
//  Created by qianfeng on 15/10/31.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ShortStoryViewController.h"

#import "AFNetworking.h"
#import "Interface.h"
#import "NSString+Frame.h"

#import "ListModel.h"
#import "ThreadvideoCell.h"
#import "CellHeight.h"
#import "CellFactory.h"


@interface ShortStoryViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    int _page;
}

@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation ShortStoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _page = 1;
    [self downloadData];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 下载数据
- (void)downloadData
{
    NSString *urlString = [NSString stringWithFormat:SHORT_URL,_page];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dataDict = dict[@"data"];
        NSString *formhash = dataDict[@"formhash"];
        NSArray *listArray = dataDict[@"list"];
        
        NSMutableArray *dataArrm = [NSMutableArray array];
        for (NSDictionary *storyDict in listArray) {
            ListModel *model = [[ListModel alloc] init];
            model.formhash = formhash;
            [model setValuesForKeysWithDictionary:storyDict];
            [dataArrm addObject:model];
        }
        _dataArray = dataArrm;
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [CellHeight cellHeightWithListModel:_dataArray[indexPath.row] tableView:self.tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListModel *model = _dataArray[indexPath.row];
    ThreadvideoCell *cell = [ThreadvideoCell threadvideoCell:self.tableView];
    cell.iconLabel.hidden = YES;
    cell.model = model;
    
    return cell;
}
- (IBAction)BackButtobClicl:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
