//
//  WQScollView.h
//  FanMovies
//
//  Created by qianfeng on 15/10/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQScollView : UIView

- (void)scrollViewWithControllers:(NSArray *)viewControllers parentControllers:(UIViewController *)parentController contentViewSize:(CGRect)frame;

@end
