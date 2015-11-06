//
//  ExplorerbannerlistModel.h
//  FanMovies
//
//  Created by qianfeng on 15/10/28.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommendModel.h"

@interface ExplorerbannerlistModel : CommendModel

@property (nonatomic,copy) NSNumber *height;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *itemid;
@property (nonatomic,copy) NSString *subject;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSNumber *width;

@end
