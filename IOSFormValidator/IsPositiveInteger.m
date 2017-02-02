//
//  IsPositiveInteger.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsPositiveInteger.h"

@implementation IsPositiveInteger
-(BOOL) isValidField:(ViewWrapper *) field{
    NSString *regExpression = @"\\d+";
    NSPredicate *test =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExpression];
    return [test evaluateWithObject:[field getText]];
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return  NSLocalizedString(@"invalid.error.positive", nil);
}
@end
