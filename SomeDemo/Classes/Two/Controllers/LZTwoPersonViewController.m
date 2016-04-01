//
//  LZTwoPersonViewController.m
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZTwoPersonViewController.h"

@interface LZTwoPersonViewController()
@property (nonatomic, strong) LZTwoPerson *model;

@property (nonatomic, strong) LZTwoPersonViewModel *viewModel;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *birthdateLabel;

@end
@implementation LZTwoPersonViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSDate *date = [NSDate date];
    LZTwoPerson *model = [[LZTwoPerson alloc] initWithSalutation:nil firstName:@"蓝科" lastName:@"尚科" birthdate:date];
    LZTwoPersonViewModel *viewModel = [[LZTwoPersonViewModel alloc] initWithPerson:model];
    
    
    self.nameLabel = [UILabel new];
    self.birthdateLabel = [UILabel new];
    
    self.nameLabel.text = viewModel.nameText;
    self.birthdateLabel.text = viewModel.birthdateText;
    fSLog(@"%@",self.nameLabel.text);
    fSLog(@"%@",self.birthdateLabel.text);
    
    
    
}


@end



























