//
//  ThreadmusicCell.m
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ThreadmusicCell.h"
#import "UIImageView+WebCache.h"

@interface ThreadmusicCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ThreadmusicCell

+ (id)threadmusicCell:(UITableView *)tableView
{
    return [self wqbaseCell:tableView];
}

- (void)setModel:(ListModel *)model
{
    _model = model;
    
    NSString *imageUrl = [NSString stringWithFormat:@"http://morguo.com/%@",model.image];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    self.titleLabel.text = model.subject;
    self.contentLabel.text = model.intro;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)PlayMusicClick:(id)sender {
}

@end
