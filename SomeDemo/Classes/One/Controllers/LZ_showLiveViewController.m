//
//  LZ_showLiveViewController.m
//  MFW
//
//  Created by scjy on 16/3/30.
//  Copyright © 2016年 马娟娟. All rights reserved.
//

#import "LZ_showLiveViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LZ_showLiveViewController ()
@property (nonatomic, strong) UITextView *textView;

@end

@implementation LZ_showLiveViewController

- (void)viewDidLoad {[super viewDidLoad];
    self.tabBarController.tabBar.hidden  =  YES;
    
//    UITextField *textField = [[UITextField alloc] initWithFrame:self.view.frame];
//    textField.placeholder = @"发一条NB的嗡嗡";
//    [self.view addSubview:textField];
    
    self.textView = [[UITextView alloc]initWithFrame:self.view.frame];
    self.textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.textView];
    //设置textView的字体颜色
    self.textView.textColor =  [UIColor grayColor];
    //设置textView的字体大小
    self.textView.font =  [UIFont fontWithName:@"FZLTHK--GBK1-0" size:25];
    //设置它的委托方法
//    self.textView.delegate = self;
    //设置内容
//    self.textView.text = @"发一条NB的嗡嗡";
    //设置返回键的类型
    self.textView.returnKeyType = UIReturnKeyNext;
    //设置键盘类型
    self.textView.keyboardType = UIKeyboardTypeDefault;
    //当文字超过视图的边框时是否允许滑动
    self.textView.scrollEnabled = YES;
    //是否允许编辑内容
    self.textView.editable = YES;
    //显示数据类型的连接模式
    self.textView.dataDetectorTypes = UIDataDetectorTypeAddress;
    //自适应高度
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
   
 
}
@end



























