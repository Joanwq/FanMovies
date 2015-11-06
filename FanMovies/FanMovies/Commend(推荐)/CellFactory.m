//
//  CellFactory.m
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "CellFactory.h"

@implementation CellFactory

+ (id)cellFactoryWithListModel:(ListModel *)model tableView:(UITableView *)tableView
{
    CommendCellBase *baseCell = nil;
    if([model.type isEqualToString:@"acinecism"])
    {
        baseCell = [AcinecismCell acinecismCell:tableView];
    }
    else if ([model.type isEqualToString:@"threadgallery"])
    {
        baseCell = [ThreadgalleryCell threadgalleryCell:tableView];
    }
    else if ([model.type isEqualToString:@"collection"])
    {
        baseCell = [CollectionCell collectionCell:tableView];
    }
    else if ([model.type isEqualToString:@"threadvideo"])
    {
        baseCell = [ThreadvideoCell threadvideoCell:tableView];
    }
    else if ([model.type isEqualToString:@"threadmusic"])
    {
        baseCell = [ThreadmusicCell threadmusicCell:tableView];
    }
    else if ([model.type isEqualToString:@"movielines"])
    {
        baseCell = [MovielinesCell movielinesCell:tableView];
    }
    else if ([model.type isEqualToString:@"threadarticle"])
    {
        baseCell = [ThreadarticleCell threadarticleCell:tableView];
    }
    else
    {
        baseCell = [ChannelCell channelCell:tableView];
    }
    baseCell.model = model;
    return baseCell;
}

@end
