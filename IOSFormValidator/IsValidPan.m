//
//  IsValidPan.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsValidPan.h"

@implementation IsValidPan
-(BOOL) isValidField:(ViewWrapper *) field{
    
    NSString *regExpression = @"[A-Z]{5}[0-9]{4}[A-Z]{1}";
    NSPredicate *test =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExpression];
    return [test evaluateWithObject:[field getText]];
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return  NSLocalizedString(@"invalid.error.pan", nil);
}
@end
