//
//  ScreenTableView.h
//  FanMovies
//
//  Created by qianfeng on 15/10/31.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenTableView : UITableView

@property (nonatomic,copy) NSString *urlString;
@property (nonatomic,strong) NSArray *dataArray;

@end
