//
//  LZThreeTableViewCell.m
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZThreeTableViewCell.h"
//#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation LZThreeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setModel:(LZThreeModel *)model{
    [self.imageUrl sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:nil];
    self.title.numberOfLines = 0;
    self.title.text = model.title;
    self.contents.numberOfLines = 0;
    self.contents.text = model.contents;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
