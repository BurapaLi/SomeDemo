//
//  LZDemoTwoTableViewController.m
//  SomeDemo
//
//  Created by scjy on 16/3/26.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZDemoTwoTableViewController.h"
#import "LZSDAutoLayoutTableViewController.h"
#import "LZTwoPersonViewController.h"
#import "LZThreeKVCTableViewController.h"
#import "LZFourKVOViewController.h"

@interface LZDemoTwoTableViewController ()
@property (nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation LZDemoTwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.titleArray = [NSMutableArray arrayWithObjects:
                       @"SDAutoLayout Demo",
                       @"MVVM Demo",
                       @"KVC Demo",
                       @"KVO Demo",
                       @"Demo",
                       @"Demo",
                       nil];
    //注册自定义的单元格
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    self.tableView.separatorColor = [UIColor redColor];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
////#warning Incomplete implementation, return the number of sections
//    return 2;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];

    
    
    
    cell.textLabel.text = self.titleArray[indexPath.row];

    return cell;
    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    fSLog(@"%lu",indexPath.row);
    if (indexPath.row == 0) {
        LZSDAutoLayoutTableViewController *lz = [LZSDAutoLayoutTableViewController new];
        [self.navigationController pushViewController:lz animated:YES];
    }
    else if (indexPath.row == 1) {
        LZTwoPersonViewController *lz = [LZTwoPersonViewController new];
        [self.navigationController pushViewController:lz animated:YES];
    }
    else if (indexPath.row == 2){
        LZThreeKVCTableViewController *lz = [LZThreeKVCTableViewController new];
        [self.navigationController pushViewController:lz animated:YES];
    }
    else if (indexPath.row == 3){
        LZFourKVOViewController *lz = [LZFourKVOViewController new];
        [self.navigationController pushViewController:lz animated:YES];
        
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
