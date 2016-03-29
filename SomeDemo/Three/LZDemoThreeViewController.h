//
//  LZDemoThreeViewController.h
//  SomeDemo
//
//  Created by scjy on 16/3/26.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum: NSInteger{
    LZAnimationTypeUIView = 0,
    LZAnimationTypeUIViewBlock,
    LZAnimationTypeCGAffineTransform,
    
    LZAnimationTypeCALayer,
    
    LZAnimationTypeCATransition,
    LZAnimationTypeCABasicAnimation,
    LZAnimationTypeCAKeyframeAnimation,
    LZAnimationTypeCAAnimationGroup
    
}LZAnimationType;

@interface LZDemoThreeViewController : UIViewController

@end
