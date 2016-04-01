//
//  LZTwoPersonViewModel.m
//  SomeDemo
//
//  Created by scjy on 16/4/1.
//  Copyright © 2016年 李志鹏. All rights reserved.
//

#import "LZTwoPersonViewModel.h"

@implementation LZTwoPersonViewModel
- (instancetype)initWithPerson:(LZTwoPerson *)person {
    
    self = [super init];
    
    if (self) {
        
        _person = person;
        
        if (person.salutation.length > 0) {
            
            _nameText = [NSString stringWithFormat:@"%@ %@ %@", self.person.salutation, self.person.firstName, self.person.lastName];
            
        } else {
            
            _nameText = [NSString stringWithFormat:@"%@ %@", self.person.firstName, self.person.lastName];
            
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
        
        _birthdateText = [dateFormatter stringFromDate:person.birthdate];
        
        
    }
    
    return self;
    
}
@end



























