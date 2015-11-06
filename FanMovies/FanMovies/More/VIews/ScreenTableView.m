//
//  ScreenTableView.m
//  FanMovies
//
//  Created by qianfeng on 15/10/31.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ScreenTableView.h"
#import "Interface.h"
#import "AFNetworking.h"
#import "ScreenModel.h"

#import "MovieCell.h"

@interface ScreenTableView()

@end

@implementation ScreenTableView

- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    [self downloadData];
}

- (void)downloadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:_urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dataDict = dict[@"data"];
        NSArray *arr = dataDict[@"list"];
        
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *moviesDict in arr) {
            ScreenModel *model = [[ScreenModel alloc] init];
            [model setValuesForKeysWithDictionary:moviesDict];
            [arrM addObject:model];
        }
        _dataArray = arrM;
        
        [self reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
