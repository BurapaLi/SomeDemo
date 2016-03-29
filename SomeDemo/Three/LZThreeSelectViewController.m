//
//  LZThreeSelectViewController.m
//  SomeDemo
//
//  Created by scjy on 16/3/26.
//  Copyright © 2016年 李志鹏. All rights reserved.
//缩放 旋转 偏移量

#import "LZThreeSelectViewController.h"
#import "LZDemoThreeViewController.h"

@interface LZThreeSelectViewController ()
@property (weak, nonatomic) IBOutlet UIView *girlView;
@property (weak, nonatomic) IBOutlet UIView *detailView;
/** <<#draw#>> */
@property (nonatomic, strong) UILabel *label;
@end

@implementation LZThreeSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.girlView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sakura_girl"]];
    self.detailView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"shit"]];
    [self.detailView sizeToFit];
    
//    NSArray * fontArrays = [[UIFont familyNames] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        NSString *str1 = (NSString *)obj1;
//        NSString *str2 = (NSString *)obj2;
//        return [str1 compare:str2];
//    }];
//    for(NSString *fontfamilyname in fontArrays)
//    {
//        NSLog(@"family:'%@'",fontfamilyname);
//        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
//        {
//            NSLog(@"\tfont:'%@'",fontName);
//        }
//        NSLog(@"-------------");
//    }
    
//    for(NSString *fontfamilyname in [UIFont familyNames])
//    {
//        fSLog(@"family:'%@'",fontfamilyname);
//        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
//        {
//            NSLog(@"\tfont:'%@'",fontName);
//        }
//        fSLog(@"-------------");
//    }
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT - 400, SCREEN_WIDTH - 20, 400)];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    //FZLTHK--GBK1-0 40 26
    UIFont *font = [UIFont fontWithName:@"FZLTHK--GBK1-0" size:23];
    label.text = @"汉体书写信息技术标准相容档案下载使用界面简单\n支援服务升级资讯专业制作创意空间快速无线上网\n㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩\nAaBbCc ＡａＢｂＣｃ";
    self.label = label;
    if (font) {
        label.font = font;
        [self.view addSubview:label];
    }else{
        [self.view addSubview:label];
        
    }
    
    
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint pressPoint = [touch locationInView:self.girlView];
    [self chooseAnimation:self.LZAnimationType withPressPonit:pressPoint];
    
}

- (void)chooseAnimation:(LZAnimationType )AnimationType withPressPonit:(CGPoint)presssPoint{
    switch (AnimationType) {
#pragma mark    //3
        case LZAnimationTypeUIView:
            [self animationWithUIviewwithPressPonit:presssPoint];
            break;
        case LZAnimationTypeUIViewBlock:
        {
            [self animationTypeUIViewBlock:presssPoint];
        }
            break;
        case LZAnimationTypeCGAffineTransform:
        {
            [self animationTypeCGAffineTransform:presssPoint];
        }
            break;
#pragma mark    //1
        case LZAnimationTypeCALayer:
        {
            [self animationTypeWithCALayer];
        }
            break;
#pragma mark    //4
        case LZAnimationTypeCAAnimationGroup:
        {
            [self animationTypeWithCAAnimationGroup];
        }
            break;
        case LZAnimationTypeCABasicAnimation:
        {
            [self animationTypeWithCABasicAnimation];
        }
            break;
        case LZAnimationTypeCATransition:
        {
            [self animationTypeWithCATransition];
        }
            break;
        case LZAnimationTypeCAKeyframeAnimation:
        {
            [self animationTypeWithCAKeyframeAnimation:presssPoint];
        }
            break;

        default:
            break;
    }
    
}
/**
 *  iOS4之前的动画（动画块实现形式）
 */
- (void)animationWithUIviewwithPressPonit:(CGPoint)presssPoint{
    //开始动画
    [UIView beginAnimations:nil context:nil];
    //setAnimationDuration设置动画的持续时间
    [UIView setAnimationDuration:4.5];
    //设置动画延迟时间
    [UIView setAnimationDelay:1];
    //设置重复次数
    [UIView setAnimationRepeatCount:3.0];
    //设置过度效果(动画效果控制)
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //这里有4种动画效果可用 只取一种用
    //设置代理
    [UIView setAnimationDelegate:self];
    //给动画开始的时候添加事件 (一定要先设置代理)
    [UIView setAnimationWillStartSelector:@selector(startAnimation)];
    //给动画结束的时候添加事件
    [UIView setAnimationDidStopSelector:@selector(stopAnimation)];
    //设置动画界面的位置
    //    self.detailView.center = CGPointMake(300,70);
    
    //动画是否翻转
    [UIView setAnimationRepeatAutoreverses:YES];
    //修改将要动画的属性，必须在动画方法之下，否则无效
    self.detailView.center = presssPoint;
    //结束动画
    [UIView commitAnimations];
}
- (void)startAnimation{
    fSLog(@"startAnimation");
    
}
- (void)stopAnimation{
    fSLog(@"stopAnimation");
    
}
- (void)animationTypeUIViewBlock:(CGPoint)presssPoint{
    //1.
//    [UIView animateWithDuration:4.5 animations:^{
//        CGPoint point = self.detailView.frame.origin;
        
//    }];

    //2.
//    [UIView animateWithDuration:20.0 delay:0.0 options:UIViewAnimationOptionAutoreverse animations:^{
//        self.detalView.center = point;
//    } completion:nil];
    //3.
    //damping弹簧强度 0强 - 1弱 SpringVelocity 开始速度
    [UIView animateWithDuration:6.0 delay:0 usingSpringWithDamping:0 initialSpringVelocity:5.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.detailView.center = presssPoint;
    } completion:nil];
    
    
}
- (void)animationTypeCGAffineTransform:(CGPoint)pressPoint{
    [UIView animateWithDuration:2.0 animations:^{
        self.label.transform = CGAffineTransformRotate(self.label.transform, M_PI_2);
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)animationTypeWithCALayer{
    //修改frame
//    self.detailView.layer.frame = CGRectMake(60, 60, 150, 150);
    //边框宽度
    self.detailView.layer.borderWidth = 3;
    //边框颜色
    self.detailView.layer.borderColor = [UIColor orangeColor].CGColor;
    //圆角
//    self.detailView.layer.cornerRadius = 75;
    //阴影颜色
    self.detailView.layer.shadowColor = [UIColor redColor].CGColor;
    //阴影半径
    self.detailView.layer.shadowRadius = 50.0;
    //阴影透明度，默认是0不显示
    self.detailView.layer.shadowOpacity = 1.0;
    //阴影偏移量
//    self.detailView.layer.shadowOffset = CGSizeMake(100, 100);
    /*
     左上角、右下角，anchorPoint分为为(0,0), (1, 1)，
     也就是说anchorPoint是在单元坐标空间(同时也是左手坐标系)中定义的。
     类似地，可以得出在白纸的中心点(0.5,0.5),
     左下角和右上角的anchorPoint为(0,1), (1,0)。
     
     然后再来看下面两张图，注意图中分iOS与MacOS，因为两者的坐标系不相同，iOS使用左手坐标系，坐标原点在左上角，MacOS使用右手坐标系，原点在左下角，我们看iOS部分即可。
     */
    self.detailView.layer.anchorPoint = CGPointMake(1, 1);
    self.detailView.transform = CGAffineTransformRotate(self.detailView.transform, M_PI_2);
    fSLog(@"%@",NSStringFromCGPoint(self.detailView.layer.position));
    fSLog(@"%@",NSStringFromCGPoint(self.detailView.layer.anchorPoint));
}

//通过设定初始点，终点，时间等，动画会沿着你的设定的点进行移动
- (void)animationTypeWithCABasicAnimation{
    //演员
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(100, 100, 150, 150);
    [self.view.layer addSublayer:layer];
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"shit"].CGImage);
    //剧本
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //动画的初始值
    anim.fromValue = [NSNumber numberWithFloat:1.0];
    //动画的结束值
    anim.toValue = [NSNumber numberWithFloat:3.0];
    //动画执行完是否原路返回
    anim.autoreverses = YES;
    anim.fillMode = kCAScrollBoth;
    anim.repeatCount = 10;
    anim.duration = 0.2;
    [layer addAnimation:anim forKey:nil];
    
}
//把这个layer所有动画组合在一起
- (void)animationTypeWithCAAnimationGroup{
    //演员
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(100, 100, 150, 150);
    [self.view.layer addSublayer:layer];
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"shit"].CGImage);
    //剧本：放大缩小
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //动画的初始值
    anim.fromValue = [NSNumber numberWithFloat:1.0];
    //动画的结束值
    anim.toValue = [NSNumber numberWithFloat:3.0];
    //动画执行完是否原路返回
    anim.autoreverses = YES;
    anim.fillMode = kCAScrollBoth;
    anim.repeatCount = 10;
    anim.duration = 0.2;
    
    //剧本：移动
    CABasicAnimation *animMove = [CABasicAnimation animationWithKeyPath:@"position"];
    //动画的初始值
    animMove.fromValue = [NSValue valueWithCGPoint:layer.position];
    //动画的结束值
    animMove.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    //动画执行完是否原路返回
    animMove.autoreverses = YES;
    animMove.fillMode = kCAScrollBoth;
    animMove.repeatCount = 5;
    animMove.duration = 1.5;
    
    //剧本：旋转
    CABasicAnimation *animrotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    //动画的初始值
    animrotation.fromValue = [NSNumber numberWithFloat:1.0];
    //动画的结束值
    animrotation.toValue = [NSNumber numberWithFloat:3.0];
    //动画执行完是否原路返回
    animrotation.autoreverses = YES;
    animrotation.fillMode = kCAScrollBoth;
    animrotation.repeatCount = 10;
    animrotation.duration = 0.2;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2.0;
    group.autoreverses = YES;
    group.fillMode = kCAScrollBoth;
    group.animations = @[anim,animMove,animrotation];
    [layer addAnimation:group forKey:@"group"];
}
- (void)animationTypeWithCATransition{
    CATransition *transition = [CATransition animation];
    //动画时间
    transition.duration = 1.0;
    //过度效果
    /*
     kCAMediaTimingFunctionLinear            线性,即匀速
     kCAMediaTimingFunctionEaseIn            先慢后快
     kCAMediaTimingFunctionEaseOut           先快后慢
     kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
     kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
     */
    transition.timingFunction = UIViewAnimationCurveEaseInOut;
    /*
     kCATransitionFade   交叉淡化过渡
     kCATransitionMoveIn 新视图移到旧视图上面
     kCATransitionPush   新视图把旧视图推出去
     kCATransitionReveal 将旧视图移开,显示下面的新视图
     */
//    transition.type = kCATransitionFade;
    transition.type = @"pageCurl";
    //动画停止的时候占整个动画的百分比
    transition.endProgress = 0.66;
    transition.fillMode = kCAFillModeForwards;
    //动画结束后是否移除
    transition.removedOnCompletion = YES;
    //过度方向
    /*
     typedef enum : NSUInteger {
     Fade = 1,                   //淡入淡出
     Push,                       //推挤
     Reveal,                     //揭开
     MoveIn,                     //覆盖
     Cube,                       //立方体
     SuckEffect,                 //吮吸
     OglFlip,                    //翻转
     RippleEffect,               //波纹
     PageCurl,                   //翻页
     PageUnCurl,                 //反翻页
     CameraIrisHollowOpen,       //开镜头
     CameraIrisHollowClose,      //关镜头
     CurlDown,                   //下翻页
     CurlUp,                     //上翻页
     FlipFromLeft,               //左翻转
     FlipFromRight,              //右翻转
     
     } AnimationType;
     */
    transition.subtype = kCATransitionFromBottom;
    //添加动画
    [self.girlView.layer addAnimation:transition forKey:@"transition"];
    
}
- (void)animationTypeWithCAKeyframeAnimation:(CGPoint)presssPoint{
    CAKeyframeAnimation *frame = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置关键帧位置，必须包含起始位置
    frame.values = @[
                     [NSValue valueWithCGPoint:self.detailView.layer.frame.origin],
                     [NSValue valueWithCGPoint:CGPointMake(100, 180)],
                     [NSValue valueWithCGPoint:CGPointMake(100, 260)],
                     [NSValue valueWithCGPoint:CGPointMake(122, 360)],
                     [NSValue valueWithCGPoint:presssPoint]
                     
                     ];
    //设定每一帧，若果没有设置，默认每一帧的时间 = 总时间 / values.count - 1
    frame.keyTimes = @[
                       [NSNumber numberWithFloat:0.1],
                       [NSNumber numberWithFloat:2.5],
                       [NSNumber numberWithFloat:2.0],
                       [NSNumber numberWithFloat:1.0],
                       [NSNumber numberWithFloat:0.1],
                       ];
    //设置每一帧的过度效果
    frame.timingFunctions = @[
                              [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                              [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                              [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                              [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                              [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                              
                              ];
    
    
    
    //动画执行完是否原路返回
    frame.autoreverses = YES;
    frame.fillMode = kCAScrollBoth;
    frame.repeatCount = 10;
    frame.duration = 0.2;
    [self.detailView.layer addAnimation:frame forKey:@"keyFrame"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //开启事务
    [CATransaction begin];
    //隐式动画禁止
    [CATransaction setDisableActions:YES];
    self.detailView.layer.position = [[anim valueForKey:@"keyFrame"] CGPointValue];
    //提交事务
    [CATransaction commit];
    
}



























@end



























