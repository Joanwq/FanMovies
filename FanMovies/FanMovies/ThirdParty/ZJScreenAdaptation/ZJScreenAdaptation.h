//
//  ZJScreenAdaptation.h
//  ScreenAdaptationPage
//
//  Created by mac on 15/4/29.
//  Copyright (c) 2015年 zhang jian. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface ZJScreenAdaptation : NSObject
//扩展函数适配Rect
CGRect CGRectMakeEx(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
//扩展适应Size
CGSize CGSizeMakeEx(CGFloat width, CGFloat height);
//扩展点
CGPoint CGPointMakeEx(CGFloat x, CGFloat y);

//适配高度
double heightEx(double height);
//适配宽度
double widthEx(double width);
@end
