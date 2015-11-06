//
//  MovieCell.h
//  FanMovies
//
//  Created by qianfeng on 15/10/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ScreenModel.h"

@interface MovieCell : UITableViewCell

+ (id)movieCell:(UITableView *)tableView;

@property (nonatomic,strong) ScreenModel *data;

@end
