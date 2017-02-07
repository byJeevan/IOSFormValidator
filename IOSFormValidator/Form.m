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
#import "Fields.h"

@implementation Form

-(instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        self.fields = [NSMutableArray new];
    }
    return self;
}


-(void) addNewField:(Field *) field {
    
    [self.fields addObject:[[Fields new] initWithField:field andDependenctyField:nil]];
    
}

-(void) addNewField:(Field *)field withDependencyField:(Field *) dependencyField{
    
    [self.fields addObject:[[Fields new] initWithField:field andDependenctyField:dependencyField]];
}


-(BOOL) isFormValid {
    
    BOOL isAllFieldsValid = NO;
    BOOL isErroFieldFound = NO;
    
    //Loop via every Fields object array
    for (Fields *fieldsObject in self.fields) {
        
        NSLog(@"We got first field : %@ \n Second : %@\n", fieldsObject.firstField, fieldsObject.dependencyField);
        
        ViewWrapper * wrapperDependencyField = fieldsObject.dependencyField.viewWrapperField;
        ViewWrapper * wrapperFirstField = fieldsObject.firstField.viewWrapperField;
        
        //Reset fields error views
        [fieldsObject.firstField hideErrorField:fieldsObject.firstField];
        [fieldsObject.dependencyField hideErrorField:fieldsObject.dependencyField];
        
        
        //Case 1 - If No dependency field, then validate first field
        
        if (wrapperDependencyField == nil) {
            
            isAllFieldsValid = [self isValidField:fieldsObject.firstField];
            
        }
        
        
        //Case 2 - If dependency field, validate it followed by first field only if valid.
        
        if (wrapperDependencyField.getText.length > 0) {
            
            isAllFieldsValid = [self isValidField:fieldsObject.dependencyField];
            
            if (isAllFieldsValid) { //if df valid then, only validate first field.
                
                isAllFieldsValid = [self isValidField:fieldsObject.firstField];
                
            }
            
        }
        
        //To focus on first error field order.
        if (!isAllFieldsValid && !isErroFieldFound) {
            isErroFieldFound = YES;
            
            [wrapperFirstField focusToView];
            
            if (wrapperDependencyField.getText.length > 0) {
                
                
                [wrapperDependencyField focusToView];
                
            }
        }
        
        
    } //For end - Fields array
    
    return isAllFieldsValid;
}


-(BOOL) isValidField:(Field *) field {
    
    ViewWrapper * wrapperField = field.viewWrapperField;
    
    if (wrapperField.isHidden) {
        
        return YES;
    }
    
    //loop for IsEmpty  / IsValidEmail class  objects in the array.
    for (NSObject<Validator> *fieldValidationItem in field.validationItemsArray) {
        
        if (![fieldValidationItem isValidField:wrapperField]) {
            
            NSLog(@"Field invalidated  %@ \n on Error item: %@ ", field, fieldValidationItem);
            
            [field showErrorField:field withMessage:[fieldValidationItem getErrorMessage:wrapperField]];
            return NO;
        }
    }
    
    return YES;
}

@end
