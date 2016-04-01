//
//  LZDemoThreeViewController.m
//  SomeDemo
//
//  Created by scjy on 16/3/26.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZDemoThreeViewController.h"
#import "LZThreeSelectViewController.h"

@interface LZDemoThreeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *detailArray;

@end

@implementation LZDemoThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = [NSMutableArray arrayWithObjects:
                       @"UIVew属性动画 Demo",
                       @"CALayer动画 Demo",
                       @"核心动画核心动画 Demo",nil];
    
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:
                              @"UIView动画快",
                              @"UIViewBlock动画",
                              @"CGAffineTransform",
                              nil];
    NSMutableArray *array2 = [NSMutableArray arrayWithObjects:
                              @"CALayer属性动画",
                              nil];
    NSMutableArray *array3 = [NSMutableArray arrayWithObjects:
                              @"CATransition",
                              @"CABasicAnimation",
                              @"CAKeyframeAnimation",
                              @"CAAnimationGroup",
                              nil];
    self.detailArray = [NSMutableArray arrayWithObjects:
                                array1,
                                array2,
                                array3,
                                nil];
//    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sakura_girl"]];
    self.tableView.tableFooterView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 33)];
//    label.frame = view.frame;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.titleArray[section];
//    UIFont *font = [UIFont fontWithName:@"FZLTHK--GBK1-0" size:40];
//    label.font = font;
    [view addSubview:label];
//    view.backgroundColor = [UIColor orangeColor];
    return view;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.titleArray.count;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.titleArray[section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.detailArray[section] count];
    
}
//750 *1334
//1242 * 2208
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    //去掉cell选中颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor grayColor];
//    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.detailArray[indexPath.section][indexPath.row];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //LZThreeSelect
    LZThreeSelectViewController *lz = [LZThreeSelectViewController new];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            lz.LZAnimationType = LZAnimationTypeUIView;
        }else if(indexPath.row == 1){
            lz.LZAnimationType = LZAnimationTypeUIViewBlock;
            
        }else{
            lz.LZAnimationType = LZAnimationTypeCGAffineTransform;
            
        }
        fSLog(@"%lu",indexPath.row);
        
    }else if (indexPath.section == 1) {
            lz.LZAnimationType = LZAnimationTypeCALayer;
        fSLog(@"%lu",indexPath.row);
    } else {
        if (indexPath.row == 0) {
            lz.LZAnimationType = LZAnimationTypeCATransition;
        }else if (indexPath.row == 1) {
            lz.LZAnimationType = LZAnimationTypeCABasicAnimation;
        }else if (indexPath.row == 2) {
            lz.LZAnimationType = LZAnimationTypeCAKeyframeAnimation;
        }else{
            lz.LZAnimationType = LZAnimationTypeCAAnimationGroup;
            
                }
        fSLog(@"%lu",indexPath.row);
    }
    [self.navigationController pushViewController:lz animated:YES];
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



























