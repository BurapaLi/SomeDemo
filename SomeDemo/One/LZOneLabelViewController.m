//
//  LZOneLabelViewController.m
//  SomeDemo
//
//  Created by scjy on 16/3/26.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZOneLabelViewController.h"

@interface LZOneLabelViewController ()

@end

@implementation LZOneLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 64, SCREEN_WIDTH - 20, SCREEN_HEIGHT - 64)];
    //UILabel 调用带属性字符串
    //[UIFont fontWithName:@"FZLTHK--GBK1-0" size:40]
    //[UIFont systemFontOfSize:14]
    NSDictionary *attributesDic = [self settingAttributesWithLineSpacing:5 FirstLineHeadIndent:2 * 14 Font:[UIFont fontWithName:@"FZLTHK--GBK1-0" size:20] TextColor:[UIColor blackColor]];
    
    label.attributedText = [[NSAttributedString alloc] initWithString:@"容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!\n容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!容易实现的它不是梦想,轻言放弃的它不是诺言,要想成功就得敢于挑战,有了梦想才有美好的明天!" attributes:attributesDic];
    label.numberOfLines = 0;
    [self.view addSubview:label];
}
- (NSDictionary *)settingAttributesWithLineSpacing:(CGFloat)lineSpacing FirstLineHeadIndent:(CGFloat)firstLineHeadIndent Font:(UIFont *)font TextColor:(UIColor *)textColor{
    //分段样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraphStyle.lineSpacing = lineSpacing;
    //首行缩进
    paragraphStyle.firstLineHeadIndent = firstLineHeadIndent;
    //富文本样式
    NSDictionary *attributeDic = @{
                                   NSFontAttributeName : font,
                                   NSParagraphStyleAttributeName : paragraphStyle,
                                   NSForegroundColorAttributeName : textColor
                                   };
    return attributeDic;
}

@end



























