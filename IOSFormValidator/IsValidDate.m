//
//  IsValidDate.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsValidDate.h"

@implementation IsValidDate
-(BOOL) isValidField:(ViewWrapper *) field{
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSDate *date = [dateFormat dateFromString:field.getText];
  
    //If date and date object is kind of NSDate class, then it must be a date produced by dateFormat.
    if (date!=nil && [date isKindOfClass:[NSDate class]]) {
        return YES;
    }
  
    return NO;
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return  NSLocalizedString(@"invalid.error.date", nil);
}
@end
