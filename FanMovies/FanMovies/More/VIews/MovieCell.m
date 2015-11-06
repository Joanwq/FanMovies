//
//  MovieCell.m
//  FanMovies
//
//  Created by qianfeng on 15/10/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "MovieCell.h"

#import "UIImageView+WebCache.h"

@interface MovieCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *moviesNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moviesTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *actsNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation MovieCell

+ (id)movieCell:(UITableView *)tableView
{
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}

- (void)setData:(ScreenModel *)data
{
    _data = data;
    
    NSString *imageUrl = [NSString stringWithFormat:@"http://morguo.com/%@",data.movData.image];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    self.moviesNameLabel.text = data.subject;
    self.moviesTimeLabel.text = data.movData.pubdate;
    self.directorNameLabel.text = data.movData.directors;
    self.actsNameLabel.text = data.movData.casts;
    self.messageLabel.text = data.message;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
