//
//  IsInRange.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsInRange.h"

@interface IsInRange()
@property(assign) int maxValue;
@property(assign) int minValue;

@end

@implementation IsInRange

-(instancetype) initWithMin:(int) min andMax:(int) max {
    if (self = [super init]) {
        self.minValue = min;
        self.maxValue = max;
    }
    return self;
}

-(BOOL) isValidField:(ViewWrapper *) field{
    if(field.getText.integerValue >= self.minValue && field.getText.integerValue <= self.maxValue)
        return YES;
    return NO;
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return  NSLocalizedString(@"invalid.error.range", nil);
}
@end
