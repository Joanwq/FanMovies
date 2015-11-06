//
//  AcinecismCell.m
//  FanMovies
//
//  Created by qianfeng on 15/10/28.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "AcinecismCell.h"
#import "UIImageView+WebCache.h"

@interface AcinecismCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImaageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation AcinecismCell

+ (id)acinecismCell:(UITableView *)tableView
{
    return [self wqbaseCell:tableView];
}

- (void)setModel:(ListModel *)model
{
    _model = model;
    
    NSString *imageUrl = [NSString stringWithFormat:@"http://morguo.com/%@",model.image];
    [self.iconImaageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    self.titleLable.text = model.subject;
    self.contentLabel.text = model.intro;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
