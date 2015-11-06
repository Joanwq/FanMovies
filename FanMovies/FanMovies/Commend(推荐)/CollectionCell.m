//
//  CollectionCell.m
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "CollectionCell.h"
#import "UIImageView+WebCache.h"

@interface CollectionCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UIButton *lookButton;

@end

@implementation CollectionCell

+ (id)collectionCell:(UITableView *)tableView
{
    return [self wqbaseCell:tableView];
}

- (void)setModel:(ListModel *)model
{
    _model = model;
    
    NSString *imageUrl = [NSString stringWithFormat:@"http://morguo.com/%@",model.image];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    self.titleLable.text = model.name;
    self.contentLable.text = model.desc;
    
    self.lookButton.layer.borderWidth = 1;
    self.lookButton.layer.borderColor = [[UIColor redColor] CGColor];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)LookButtonClick:(id)sender {
    
}

@end
