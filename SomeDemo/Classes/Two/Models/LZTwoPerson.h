//
//  LZTwoPerson.h
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZTwoPerson : NSObject


@property (nonatomic, copy) NSString *salutation;

@property (nonatomic, copy, readonly) NSString *firstName;

@property (nonatomic, copy, readonly) NSString *lastName;

@property (nonatomic, copy, readonly) NSDate *birthdate;

- (instancetype)initWithSalutation:(NSString *)salutation firstName:(NSString *)firstName lastName:(NSString *)lastName birthdate:(NSDate *)birthdate;
@end
