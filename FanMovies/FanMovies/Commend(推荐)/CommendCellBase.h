//
//  CommendCellBase.h
//  FindMovies
//
//  Created by qianfeng on 15/10/28.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"

@interface CommendCellBase : UITableViewCell
{
    ListModel *_model;
}

@property (nonatomic,strong) ListModel *model;
+ (id)wqbaseCell:(UITableView *)tableView;

@end
