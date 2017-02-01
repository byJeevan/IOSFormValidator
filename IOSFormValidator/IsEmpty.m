//
//  IsEmpty.m
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsEmpty.h"
#import "FieldView.h"

@implementation IsEmpty

-(BOOL) isValidField:(FieldView *) field{
    
    return field.textField.text.length > 0 ? YES:NO;
}

-(NSString *) getErrorMessage:(FieldView *) field{
    
    return @"Cannot be empty field";
}


@end
