//
//  MMAdsView.h
//  AdsViewDemo
//
//  Created by qianfeng on 15/10/22.
//  Copyright © 2015年 cherry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMAdsView : UIView
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;


//一组img的url
@property(nonatomic)NSArray *imgUrlArray;
//一组img的name
@property(nonatomic)NSArray *imgArray;

//若每页都加一样的标题，那么就给titleLabel赋值就可以了
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

//若每页的标题都不一样，那就赋值给titleArray
@property(nonatomic)NSArray *titleArray;

//title的颜色，默认为灰色
@property(nonatomic)UIColor *titleColor;

//滚动间隔
@property(nonatomic)float scrollInterval;

//每张图片滚动所用时间
@property(nonatomic)float scrollDelay;

+ (id)mmAdsViewWithFrame:(CGRect)frame;

- (void)startTimer;

@end
