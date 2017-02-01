//
//  ValidatorInterface.h
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FieldView;

/**
 * Interface class for the Validator
 */
@protocol Validator

-(BOOL) isValidField:(FieldView *) field;

-(NSString *) getErrorMessage:(FieldView *) field;

@end

 
