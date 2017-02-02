//
//  IsValidAadhaarNumber.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsValidAadhaarNumber.h"

@implementation IsValidAadhaarNumber
-(BOOL) isValidField:(ViewWrapper *) field{
    
    NSString *regExpression = @"\\d{12}";
    NSPredicate *test =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExpression];
    return [test evaluateWithObject:[field getText]];
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return  NSLocalizedString(@"invalid.error.aadhaar", nil);
}
@end
