//
//  IsValidLength.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsValidLength.h"

@interface IsValidLength()
@property(assign) int minLength;
@property(assign) int maxLength;
@end

@implementation IsValidLength

-(instancetype) initWithMinLength:(int) min andMaxLength:(int) max {
    if (self = [super init]) {
        self.minLength = min;
        self.maxLength = max;
    }
    return self;
}

-(instancetype) initWithMinLength:(int) min {
    
   return [self initWithMinLength:min andMaxLength:-1];
}

-(instancetype) initWithMaxLength:(int) max {
    
   return [self initWithMinLength:-1 andMaxLength:max];
}

-(BOOL) isValidField:(ViewWrapper *) field{
 
    NSString *value = field.getText;
    
    if (value.length == 0) {
        return NO;
    }
    
    if (self.minLength > 0 && self.maxLength > 0) {
        return value.length >= self.minLength && value.length <=  self.maxLength;
    }
    
    if (self.minLength > 0 && self.maxLength < 0) {
        return value.length >= self.minLength;
    }
    
    return value.length <=  self.maxLength;
 
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return NSLocalizedString(@"invalid.error.field", nil);
}
@end
