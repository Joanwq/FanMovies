//
//  RefreshTableViewController.h
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,RefreshType)
{
    RefreshTypeHeader = 1,
    RefreshTypeFooter = 1<<1,
    RefreshTypeAll = RefreshTypeHeader | RefreshTypeFooter,
};

@interface RefreshTableViewController : UITableViewController

@property (nonatomic) NSString *cachePath;
@property (nonatomic) NSString *url;
@property (nonatomic) NSMutableArray *explorerbannerlistArrM;
@property (nonatomic) NSMutableArray *explorerhotkeywordlistArrM;
@property (nonatomic) NSMutableArray *listArrM;

@property (nonatomic) RefreshType refreshType;

- (void)endFooterRefresh;

@end
