//
//  IsAlphaNumeric.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsAlphaNumeric.h"

@implementation IsAlphaNumeric
-(BOOL) isValidField:(ViewWrapper *) field{
    
    NSString *regExpression = @"[0-9a-zA-Z]*";
    NSPredicate *test =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExpression];
    return [test evaluateWithObject:[field getText]];
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return NSLocalizedString(@"invalid.error.alphanumeric", nil);
}
@end
