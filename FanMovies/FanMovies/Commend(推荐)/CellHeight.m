
//
//  CellHeight.m
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "CellHeight.h"

#import "NSString+Frame.h"

@implementation CellHeight

+ (CGFloat)cellHeightWithListModel:(ListModel *)model tableView:(UITableView *)tableView
{
    CommendCellBase *baseCell = nil;
    NSString *str = [[NSString alloc] init];
    if([model.type isEqualToString:@"acinecism"])
    {
        baseCell = [AcinecismCell acinecismCell:tableView];
        str = model.intro;
    }
    else if ([model.type isEqualToString:@"threadgallery"])
    {
        baseCell = [ThreadgalleryCell threadgalleryCell:tableView];
        str = model.intro;
    }
    else if ([model.type isEqualToString:@"collection"])
    {
        baseCell = [CollectionCell collectionCell:tableView];
        str = model.desc;
    }
    else if ([model.type isEqualToString:@"threadvideo"])
    {
        baseCell = [ThreadvideoCell threadvideoCell:tableView];
        str = model.intro;
    }
    else if ([model.type isEqualToString:@"threadmusic"])
    {
        baseCell = [ThreadmusicCell threadmusicCell:tableView];
        str = model.intro;
    }
    else if ([model.type isEqualToString:@"movielines"])
    {
        baseCell = [MovielinesCell movielinesCell:tableView];
        str = model.intro;
    }
    else if ([model.type isEqualToString:@"threadarticle"])
    {
        baseCell = [ThreadarticleCell threadarticleCell:tableView];
        str = model.intro;
    }
    else
    {
        baseCell = [ChannelCell channelCell:tableView];
        str = model.desc;
    }
    CGFloat H = baseCell.frame.size.height;
    CGFloat contentWidth = baseCell.frame.size.width-16;
    CGFloat contentHeight = [str heightWithFont:[UIFont systemFontOfSize:13] withinWidth:contentWidth];
    return H+contentHeight;
}

@end
