//
//  FormParentView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "FormParentView.h"
#import "FieldView.h"
#import "ValidatorInterface.h"

@interface FormParentView()

@end

@implementation FormParentView

-(BOOL) isFormValid {
    
    BOOL isAllElementsValid = YES;
    
    //Loop through every fields in the form view,
    for (UIView *subview in self.subviews)
    {
        
        NSLog(@"Subiview : %@", subview);
        
        if ([subview isKindOfClass:FieldView.class]) {
            
            FieldView * fieldView = (FieldView *) subview;
            
            //loop for IsEmpty  / IsValidEmail class  objects in the array.
            for (NSObject<Validator> *fieldValidationItem in fieldView.validationFieldsArray)
            {
                //Set error message field
                
                if (![fieldValidationItem isValidField:fieldView.viewWrapperField]) {
                    
                    NSLog(@"Field  valid: %@ ", subview);
       
                    isAllElementsValid = NO;
 
                    [fieldView showErrorBackgroundWithMessage:[fieldValidationItem getErrorMessage:fieldView.viewWrapperField]];
                    
                }
                else{
                    
                    NSLog(@"Field  Invalid: %@ ", subview);
 
                    [fieldView hideErrorBackground];
                    
                }
                
            }
        }
    }
    
   return isAllElementsValid;
}

@end
