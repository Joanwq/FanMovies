//
//  ListModel.h
//  FanMovies
//
//  Created by qianfeng on 15/10/28.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommendModel.h"

@interface ListModel : CommendModel

//共有的
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSNumber *height;
@property (nonatomic,copy) NSNumber *width;

//channel、collection
@property (nonatomic,copy) NSString *ctid;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *threadnum;

//threadmusic、acinecism、threadvideo、threadarticle、movielines、threadgallery
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *authorid;
@property (nonatomic,copy) NSString *dateline;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSNumber *isliked;
@property (nonatomic,copy) NSString *liketimes;
@property (nonatomic,copy) NSString *message;
@property (nonatomic,copy) NSString *movietid;
@property (nonatomic,copy) NSString *replies;
@property (nonatomic,copy) NSString *special;
@property (nonatomic,copy) NSString *subject;
@property (nonatomic,copy) NSString *tid;

//threadmusic
@property (nonatomic,copy) NSString *musicurl;
//threadvideo
@property (nonatomic,copy) NSString *videourl;
//threadgallery
@property (nonatomic,copy) NSNumber *imagecount;
@property (nonatomic,copy) NSArray *imagelist;











@end
