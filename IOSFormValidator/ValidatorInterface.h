//
//  ValidatorInterface.h
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ViewWrapper;

/**
 * Interface class for the Validator
 */
@protocol Validator

-(BOOL) isValidField:(ViewWrapper *) field;

-(NSString *) getErrorMessage:(ViewWrapper *) field;

@end

 
