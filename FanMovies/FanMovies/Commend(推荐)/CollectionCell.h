//
//  CollectionCell.h
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommendCellBase.h"

@interface CollectionCell : CommendCellBase

@property (weak, nonatomic) IBOutlet UILabel *iconLabel;
+ (id)collectionCell:(UITableView *)tableView;

@end
