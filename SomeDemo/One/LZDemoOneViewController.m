//
//  LZDemoOneViewController.m
//  SomeDemo
//
//  Created by scjy on 16/3/26.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZDemoOneViewController.h"
#import "LZOneLabelViewController.h"
#import "KCShakeViewController.h"

@interface LZDemoOneViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation LZDemoOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = [NSMutableArray arrayWithObjects:
                       @"设备获取 Demo",
                       @"第一次判断 Demo",
                       @"UILabel修改行距,首行缩进 Demo",
                       @"Demo",
                       @"Demo",
                       @"Demo",
                       @"Demo",
                       @"Demo",
                       nil];
    
    self.tableView.tableFooterView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.edgesForExtendedLayout = UIRectEdgeNone;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titleArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
        switch (indexPath.row %4) {
            case 0:
                //创建一个UITableViewCell 对象,使用UITableViewCellStyleSubtitle风格
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                break;
                
            case 1:
                // 创建一个UITableViewCell对象，使用默认风格
                cell = [[UITableViewCell alloc]
                        initWithStyle:UITableViewCellStyleDefault
                        reuseIdentifier:cellIdentifier];
                cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

                break;
            case 2:
                // 创建一个UITableViewCell对象，使用UITableViewCellStyleValue1风格
                cell = [[UITableViewCell alloc]
                        initWithStyle:UITableViewCellStyleValue1
                        reuseIdentifier:cellIdentifier];
                cell.accessoryType = UITableViewCellAccessoryCheckmark;

                break;
            case 3:
                // 创建一个UITableViewCell对象，使用UITableViewCellStyleValue2风格
                cell = [[UITableViewCell alloc]
                        initWithStyle:UITableViewCellStyleValue2
                        reuseIdentifier:cellIdentifier];
                cell.accessoryType = UITableViewCellAccessoryDetailButton;

                break;
            default:
                break;
        }

    }
    //去掉cell选中颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    cell.textLabel.text = self.titleArray[indexPath.row];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        //获取手机硬件信息，APP信息（UUID，应用版本等）
        //手机序列号 UUID
        NSString* identifierNumber = [[UIDevice currentDevice].identifierForVendor UUIDString] ;
        
        fSLog(@"手机序列号: %@",identifierNumber);
        
        //手机别名： 用户定义的名称
        NSString* userPhoneName = [[UIDevice currentDevice] name];
        
        fSLog(@"手机别名: %@", userPhoneName);
        
        //设备名称
        NSString* deviceName = [[UIDevice currentDevice] systemName];
        
        fSLog(@"设备名称: %@",deviceName );
        
        //手机系统版本
        NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
        
        fSLog(@"手机系统版本: %@", phoneVersion);
        
        //手机型号
        NSString* phoneModel = [[UIDevice currentDevice] model];
        
        fSLog(@"手机型号: %@",phoneModel );
        
        //地方型号 （国际化区域名称）
        NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
        
        fSLog(@"国际化区域名称: %@",localPhoneModel );
        
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        // 当前应用名称
        NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
        
        fSLog(@"当前应用名称：%@",appCurName);
        
        // 当前应用软件版本 比如：1.0.1
        NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        
        fSLog(@"当前应用软件版本:%@",appCurVersion);
        
        // 当前应用版本号码 int类型
        NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
        
        fSLog(@"当前应用版本号码：%@",appCurVersionNum);
        
/*
 模拟器
 2016-03-26 09:20:17.548 SomeDemo[48265:665116] 手机序列号: 2056DFD9-6642-42AD-A092-27809A63AB31
 2016-03-26 09:20:17.549 SomeDemo[48265:665116] 手机别名: iPhone Simulator
 2016-03-26 09:20:17.549 SomeDemo[48265:665116] 设备名称: iPhone OS
 2016-03-26 09:20:17.549 SomeDemo[48265:665116] 手机系统版本: 9.2
 2016-03-26 09:20:17.549 SomeDemo[48265:665116] 手机型号: iPhone
 2016-03-26 09:20:17.550 SomeDemo[48265:665116] 国际化区域名称: iPhone
 2016-03-26 09:20:17.550 SomeDemo[48265:665116] 当前应用名称：(null)
 2016-03-26 09:20:17.550 SomeDemo[48265:665116] 当前应用软件版本:1.0
 2016-03-26 09:20:17.550 SomeDemo[48265:665116] 当前应用版本号码：1
 真机
 2016-03-26 09:18:27.791 SomeDemo[2029:964421] 手机序列号: 329F33A6-35C5-4F4D-904C-77F54A392EAB
 2016-03-26 09:18:27.794 SomeDemo[2029:964421] 手机别名: “scjy”的 iPad
 2016-03-26 09:18:27.795 SomeDemo[2029:964421] 设备名称: iPhone OS
 2016-03-26 09:18:27.795 SomeDemo[2029:964421] 手机系统版本: 9.2.1
 2016-03-26 09:18:27.795 SomeDemo[2029:964421] 手机型号: iPad
 2016-03-26 09:18:27.795 SomeDemo[2029:964421] 国际化区域名称: iPad
 2016-03-26 09:18:27.796 SomeDemo[2029:964421] 当前应用名称：(null)
 2016-03-26 09:18:27.796 SomeDemo[2029:964421] 当前应用软件版本:1.0
 2016-03-26 09:18:27.796 SomeDemo[2029:964421] 当前应用版本号码：1
 
 */
    }
    else if (indexPath.row == 1) {
        //判断用户是否第一次操作
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        BOOL isFirst =  [[userDefault objectForKey:@"isfirstlzc"] boolValue];
        fSLog(@"isfirstlzc:%d",isFirst);
        if(!isFirst) {
            //里边是你需要的操作
            fSLog(@"isfirstlzc:%d",isFirst);
        }
        [userDefault setObject:@"YES"forKey:@"isfirstlzc"];
        [userDefault synchronize];
    }
    else if (indexPath.row == 2){
        LZOneLabelViewController *lz = [LZOneLabelViewController new];
        [self.navigationController pushViewController:lz animated:YES];
    }
    else if (indexPath.row == 3){
        KCShakeViewController *kc = [KCShakeViewController new];
        [self.navigationController pushViewController:kc animated:YES];
        
    }
}
@end



























