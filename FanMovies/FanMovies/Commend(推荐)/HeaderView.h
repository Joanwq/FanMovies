//
//  HeaderView.h
//  FindMovies
//
//  Created by qianfeng on 15/10/28.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeaderView;
@protocol HeaderViewButtonClickDelegate <NSObject>

- (void)screenButtonClickWithHeaderView:(HeaderView *)headerView button:(UIButton *)button;
- (void)shortStoryButtobClickHeaderView:(HeaderView *)headerView button:(UIButton *)button;
- (void)moviesListButtonClcikHeaderView:(HeaderView *)headerView button:(UIButton *)button;
- (void)moreButtonClickHeaderView:(HeaderView *)headerView button:(UIButton *)button;

@end

@interface HeaderView : UIView

+ (id)headView;

@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) id<HeaderViewButtonClickDelegate> delegate;

@end
