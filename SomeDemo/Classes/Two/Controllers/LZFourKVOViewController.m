//
//  LZFourKVOViewController.m
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZFourKVOViewController.h"
#import "LZTwoPerson.h"

@interface LZFourKVOViewController ()
@property (nonatomic, strong) LZTwoPerson *model;
@property (weak, nonatomic) IBOutlet UIButton *bankCard;
@property (weak, nonatomic) IBOutlet UITextField *balance;
@property (weak, nonatomic) IBOutlet UIButton *query;
@property (weak, nonatomic) IBOutlet UIButton *deposit;

@end

@implementation LZFourKVOViewController
- (IBAction)query:(id)sender {
    self.model.salutation = [NSString stringWithFormat:@"%d",arc4random() % 10000];
    fSLog(@"%@",self.balance.text);
}
- (IBAction)deposit:(id)sender {
    fSLog(@"%@",self.model.salutation);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.balance.backgroundColor = [UIColor darkGrayColor];
    self.model.salutation = @"6666";
    [self.model addObserver:self forKeyPath:@"salutation" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    fSLog(@"%@",keyPath);
    fSLog(@"%@",change[@"salutation"]);
    fSLog(@"%@",object);
    fSLog(@"%@",context);
    if ([keyPath isEqualToString:@"salutation"]) {
        self.balance.text = change[@"salutation"];
    }
    
}
- (void)dealloc{
    [self.balance removeObserver:self forKeyPath:@"salutation"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
