//
//  LZTwoPersonViewModel.h
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZTwoPerson.h"

@interface LZTwoPersonViewModel : NSObject
- (instancetype)initWithPerson:(LZTwoPerson *)person;

@property (nonatomic, strong, readonly) LZTwoPerson *person;

@property (nonatomic, copy, readonly) NSString *nameText;

@property (nonatomic, copy, readonly) NSString *birthdateText;

@end
