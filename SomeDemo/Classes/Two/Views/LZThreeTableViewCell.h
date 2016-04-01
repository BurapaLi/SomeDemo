//
//  LZThreeTableViewCell.h
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZThreeModel.h"

@interface LZThreeTableViewCell : UITableViewCell
@property (nonatomic, strong) LZThreeModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imageUrl;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *contents;


@end
