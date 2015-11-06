//
//  ScreenModel.m
//  FanMovies
//
//  Created by qianfeng on 15/10/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ScreenModel.h"

@implementation ScreenModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"moviedata"]) {
        NSDictionary *dict = value;
        MovieData *data = [[MovieData alloc] init];
        [data setValuesForKeysWithDictionary:dict];
        self.movData = data;
    }
}

@end
