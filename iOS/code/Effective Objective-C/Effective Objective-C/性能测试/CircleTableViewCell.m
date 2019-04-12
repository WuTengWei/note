//
//  CircleTableViewCell.m
//  Effective Objective-C
//
//  Created by wtw on 2018/2/2.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "CircleTableViewCell.h"

@implementation CircleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSLog(@"%s",__func__);

    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
