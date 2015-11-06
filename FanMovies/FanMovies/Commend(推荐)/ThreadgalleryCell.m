//
//  ThreadgalleryCellTableViewCell.m
//  FanMovies
//
//  Created by qianfeng on 15/10/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ThreadgalleryCell.h"
#import "UIImageView+WebCache.h"

@interface ThreadgalleryCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView0;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5;
@property (weak, nonatomic) IBOutlet UIImageView *imageView6;
@property (weak, nonatomic) IBOutlet UIImageView *imageView7;
@property (weak, nonatomic) IBOutlet UIImageView *imageView8;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ThreadgalleryCell

+ (id)threadgalleryCell:(UITableView *)tableView
{
    return [self wqbaseCell:tableView];
}

- (void)setModel:(ListModel *)model
{
    _model = model;
    
    NSArray *imageArray = @[self.imageView0,self.imageView1,self.imageView2,self.imageView3,self.imageView4,self.imageView5,self.imageView6,self.imageView7,self.imageView8];
    for(int i=0;i<imageArray.count;i++)
    {
        UIImageView *images = imageArray[i];
        NSMutableArray *imagesArrm = [NSMutableArray array];
        NSString *imageUrl = [[NSString alloc] init];
        for (NSDictionary *imageDict in model.imagelist) {
            NSString *str = imageDict[@"thumb"];
            [imagesArrm addObject:str];
        }
        imageUrl = [NSString stringWithFormat:@"http://morguo.com/%@",imagesArrm[i]];
        [images sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
        
        self.titleLable.text = model.subject;
        self.contentLabel.text = model.intro;
    }
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
