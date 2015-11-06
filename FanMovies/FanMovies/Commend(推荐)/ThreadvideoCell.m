//
//  ThreadvideoCell.m
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ThreadvideoCell.h"
#import "UIImageView+WebCache.h"

@interface ThreadvideoCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ThreadvideoCell

+ (id)threadvideoCell:(UITableView *)tableView
{
    return [self wqbaseCell:tableView];
}

- (void)setModel:(ListModel *)model
{
    _model = model;
    
    NSString *imageUrl = [NSString stringWithFormat:@"http://morguo.com/%@",model.image];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    self.titleLable.text = model.subject;
    self.contentLabel.text = model.intro;
}

- (IBAction)PlayMoviesClick:(id)sender {
    
}


@end
