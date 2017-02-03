//
//  IsValidDependencyField.m
//  IOSFormValidator
//
//  Created by Jeevan on 03/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "IsValidDependencyField.h"

@interface IsValidDependencyField()
@property (nonatomic) ViewWrapper *firstFieldObject;
@property (nonatomic) ViewWrapper *secondFieldObject;
@end

@implementation IsValidDependencyField

-(instancetype) initWithFirstField:(Field *) firstField {
    
    if (self = [super init]) {
        
        self.firstFieldObject = firstField.viewWrapperField;
    }
    
    return self;
}

-(BOOL) isValidField:(ViewWrapper *) field {
    self.secondFieldObject = field;

    //Check first field has any value
    if ([self.firstFieldObject getText].length > 0) {
        
        //If yes - first field has got value
        //Validate current field. - Form
        return NO;
    }
    
    return YES;
}

-(NSString *) getErrorMessage:(ViewWrapper *) field{
    
    return  NSLocalizedString(@"invalid.error.dependency.field", nil);
}

@end
