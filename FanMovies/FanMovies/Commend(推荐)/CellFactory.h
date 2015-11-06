//
//  CellFactory.h
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AcinecismCell.h"
#import "ThreadarticleCell.h"
#import "CollectionCell.h"
#import "ThreadgalleryCell.h"
#import "ThreadmusicCell.h"
#import "ThreadvideoCell.h"
#import "MovielinesCell.h"
#import "ChannelCell.h"
#import "ListModel.h"

@interface CellFactory : NSObject

+ (id)cellFactoryWithListModel:(ListModel *)model tableView:(UITableView *)tableView;

@end
