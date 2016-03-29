//
//  LZTabBarViewController.m
//  SomeDemo
//
//  Created by scjy on 16/3/26.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZTabBarViewController.h"
#import "LZDemoTwoTableViewController.h"

@interface LZTabBarViewController ()

@end

@implementation LZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildStoryboard:@"LZDemoOne" title:@"one" image:nil selectedImage:nil];
    LZDemoTwoTableViewController *lz = [LZDemoTwoTableViewController new];
    [self addChildVc:lz title:@"two" image:nil selectedImage:nil];
    [self addChildStoryboard:@"LZDemoThree" title:@"three" image:nil selectedImage:nil];
}

- (void)addChildStoryboard:(NSString *)ChildStoryboard title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    UIStoryboard *lz = [UIStoryboard storyboardWithName:ChildStoryboard bundle:nil];
    UINavigationController *lzNav = lz.instantiateInitialViewController;
    lzNav.tabBarItem.title = title;
    lzNav.tabBarItem.image = [UIImage imageNamed:image];
    lzNav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBar.tintColor = [UIColor orangeColor];
//    self.selectedIndex = 3;
    [self addChildViewController:lzNav];
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title;
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    // 先给外面传进来的小控制器 包装 一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}
@end



























