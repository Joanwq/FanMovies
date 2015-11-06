//
//  WQScollView.m
//  FanMovies
//
//  Created by qianfeng on 15/10/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "WQScollView.h"

@interface WQScollView()

@property (nonatomic,strong) UIScrollView *topScrollView;
@property (nonatomic,strong) UIScrollView *contentScrollView;
@property (nonatomic,strong) NSArray *viewControllers;
@property (nonatomic,strong) UIViewController *parentViewController;

@end

@implementation WQScollView

- (void)scrollViewWithControllers:(NSArray *)viewControllers parentControllers:(UIViewController *)parentController contentViewSize:(CGRect)frame
{
    self.viewControllers = viewControllers;;
    self.parentViewController = parentController;
    
    self.contentScrollView.frame = frame;
    self.contentScrollView.delegate = self;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    for(int i=0;i<viewControllers.count;i++)
    {
        UIViewController *vc = viewControllers[i];
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
