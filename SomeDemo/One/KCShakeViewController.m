#import "KCShakeViewController.h"
#import "KCImageView.h"
@interface KCShakeViewController (){
    KCImageView *_imageView;
}
@end
@implementation KCShakeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark 视图显示时让控件变成第一响应者
//[UIScreen mainScreen].applicationFrame]
- (void)viewDidAppear:(BOOL)animated{
    _imageView = [[KCImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _imageView.userInteractionEnabled = true;
    [self.view addSubview:_imageView];
    [_imageView becomeFirstResponder];
}
#pragma mark 视图不显示时注销控件第一响应者的身份
- (void)viewDidDisappear:(BOOL)animated{
    [_imageView resignFirstResponder];
}
@end



























