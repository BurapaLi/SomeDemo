//
//  LZTwoPerson.m
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZTwoPerson.h"

@implementation LZTwoPerson

- (instancetype)initWithSalutation:(NSString *)salutation firstName:(NSString *)firstName lastName:(NSString *)lastName birthdate:(NSDate *)birthdate{
    self = [super init];
    if (self) {
        _salutation = salutation;
        _firstName = firstName;
        _lastName = lastName;
        _birthdate = birthdate;
    }
    return self;
}



@end
