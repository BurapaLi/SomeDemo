//
//  LZSDAutoLayoutTableViewCell.m
//  SomeDemo
//
//  Created by scjy on 16/3/27.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZSDAutoLayoutTableViewCell.h"
#import "UIView+SDAutoLayout.h"

@implementation LZSDAutoLayoutTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UIImageView *view = [UIImageView new];
    view.backgroundColor = [UIColor redColor];
    
    UIView *view1 = [UIView new];
    view1.backgroundColor = [UIColor yellowColor];
    
    UILabel *view2 = [UILabel new];
    view2.text = @"jfdsfjksjafksdalfhsdklfjsasdfkslgjsjkljfdsklfajfklsgjklsdgjklsfjklsjgksjfksalgjklsagjklsdgjklsagjksagj;lsadgjaops";
    view2.backgroundColor = [UIColor darkGrayColor];
    
    UILabel *view3 = [UILabel new];
//    view3.text = @"jfdsfjkjklsdgjklsagjksagj;lsadgjaops";
    view3.backgroundColor = [UIColor orangeColor];
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor greenColor];
    
    UIView *view5 = [UIView new];
    view5.backgroundColor = [UIColor blueColor];
    
    [self.contentView addSubview:view];
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    [self.contentView addSubview:view3];
    [self.contentView addSubview:view4];
    [self.contentView addSubview:view5];
    
    view.sd_layout .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .widthIs(50)
    .heightIs(50);
    
    view1.sd_layout
    .topEqualToView(view)
    .leftSpaceToView(view, 10)
    .rightSpaceToView(self.contentView, 10)
    .heightRatioToView(view, 0.4);
    
    view2.sd_layout
    .topSpaceToView(view1, 10)
    .rightSpaceToView(self.contentView, 60)
    .leftEqualToView(view1)
    .autoHeightRatio(0);
    
    view3.sd_layout
    .topEqualToView(view2)
    .leftSpaceToView(view2,10)
    .heightRatioToView(view2,1)
    .rightEqualToView(view1);
    
    view4.sd_layout.leftEqualToView(view2).topSpaceToView(view2, 10).heightIs(30).widthRatioToView(view1, 0.7);
    
    view5.sd_layout.leftSpaceToView(view4, 10).topEqualToView(view4).rightSpaceToView(self.contentView, 10).heightRatioToView(view4, 1);
    
    
    
    [self setupAutoHeightWithBottomView:view4 bottomMargin:10];
}


@end



























