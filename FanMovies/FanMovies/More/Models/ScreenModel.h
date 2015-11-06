//
//  ScreenModel.h
//  FanMovies
//
//  Created by qianfeng on 15/10/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MovieData.h"

@interface ScreenModel : NSObject

@property (nonatomic,copy) NSString *subject;
@property (nonatomic,copy) NSString *liketimes;
@property (nonatomic,copy) NSString *message;
@property (nonatomic,copy) NSNumber *isliked;
@property (nonatomic,copy) NSString *collections;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *authorid;
@property (nonatomic,copy) NSString *fid;
@property (nonatomic,copy) NSString *specialname;
@property (nonatomic,copy) NSString *special;
@property (nonatomic,copy) NSString *dateline;
@property (nonatomic,copy) NSString *replies;
@property (nonatomic,copy) NSString *tid;
@property (nonatomic,copy) NSString *formhash;

@property(nonatomic)MovieData *movData;

@end
