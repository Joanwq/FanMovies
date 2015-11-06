//
//  CommendTableViewController.h
//  FindMovies
//
//  Created by qianfeng on 15/10/26.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshTableViewController.h"

@class CommendTableViewController;
@protocol CommendTableViewControllerDelegate <NSObject>

- (void)moreButtonClickWithViewController:(UIViewController *)viewController button:(UIButton *)button;

@end

@interface CommendTableViewController : RefreshTableViewController

@property (nonatomic,strong) id<CommendTableViewControllerDelegate> delegate;

@end
