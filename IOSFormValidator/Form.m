//
//  Form.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "Form.h"
#import "ValidatorInterface.h"
#import "ViewWrapperFactory.h"

@implementation Form

-(instancetype) init {
    
    self = [super init];
    
    if (self) {
        self.fields = [NSMutableArray new];
    }
    return self;
}


-(void) addNewField:(Field *) field {
    [self.fields addObject:field];
}


-(BOOL) isFormValid {
    
    BOOL isAllElementsValid = YES;
    
    //Loop through every fields in the form view,
    for (Field *field in self.fields)
    {
        NSLog(@"We got field : %@ from fields arrray \n", field);
        
        if ([field isKindOfClass:Field.class]) {
            
            //Set error message field
            ViewWrapper * wrapper = field.viewWrapperField;
            
            //loop for IsEmpty  / IsValidEmail class  objects in the array.
            for (NSObject<Validator> *fieldValidationItem in field.validationItemsArray)
            {
         
                if (![fieldValidationItem isValidField:wrapper]) {
                    
                    NSLog(@"Field  INvalid: %@ \n Error item: %@ ", field, fieldValidationItem);
                    
                    
                    if (isAllElementsValid) { //Invalid call back - trap for first field to focus
                        
                        [wrapper focusToView];
                    }
                    
                    isAllElementsValid = NO;
                    
                    [field showErrorField:field withMessage:[fieldValidationItem getErrorMessage:wrapper]];
                    
                     break;
                }
                else{
                    
                    NSLog(@"Field  Valid: %@ ", field);
                    
                    [field hideErrorField:field];
                    
                }
                
            }
        }
    }

    
    return isAllElementsValid;
}


@end
