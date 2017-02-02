//
//  IsValidTime.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsValidTime.h"

@implementation IsValidTime

-(BOOL) isValidField:(ViewWrapper *) field{
    
    NSString *regExpression = @"([01]?[0-9]|2[0-3]):[0-5][0-9]";
    NSPredicate *test =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExpression];
    return [test evaluateWithObject:[field getText]];
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return  NSLocalizedString(@"invalid.error.time", nil);
}


@end
