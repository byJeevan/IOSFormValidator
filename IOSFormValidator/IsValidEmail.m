//
//  IsValidEmail.m
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsValidEmail.h"

@implementation IsValidEmail

-(BOOL) isValidField:(ViewWrapper *) field{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:[field getText]];

}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    return NSLocalizedString(@"invalid.error.email", nil);
}


@end
