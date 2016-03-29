#import "KCImageView.h"
#define kImageCount 3
@implementation KCImageView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [self getImage];
    }
    return self;
}
#pragma mark 设置控件可以成为第一响应者
- (BOOL)canBecomeFirstResponder{
    return YES;
}
#pragma mark 运动开始
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    //这里只处理摇晃事件
    if (motion == UIEventSubtypeMotionShake) {
        self.image = [self getImage];
    }
}
#pragma mark 运动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
}
#pragma mark 随机取得图片
- (UIImage *)getImage{
//    int index = arc4random() % kImageCount;
    //    NSString *imageName = [NSString stringWithFormat:@"angry_%i.png",index];
    int index = arc4random() % kImageCount;
    NSString *imageName = [NSString stringWithFormat:@"angry_%02d",index];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}
@end



























