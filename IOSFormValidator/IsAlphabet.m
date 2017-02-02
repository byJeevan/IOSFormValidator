//
//  IsAlphabet.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsAlphabet.h"

@implementation IsAlphabet
-(BOOL) isValidField:(ViewWrapper *) field{
    
    NSString *regExpression = @"[a-zA-Z]*";
    NSPredicate *test =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExpression];
    return [test evaluateWithObject:[field getText]];
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return NSLocalizedString(@"invalid.error.alphabet", nil);
}
@end
