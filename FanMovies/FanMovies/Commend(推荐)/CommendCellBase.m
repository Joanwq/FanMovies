//
//  CommendCellBase.m
//  FindMovies
//
//  Created by qianfeng on 15/10/28.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "CommendCellBase.h"

@implementation CommendCellBase

+ (id)wqbaseCell:(UITableView *)tableView
{
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
