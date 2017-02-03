//
//  IsValidDependencyField.h
//  IOSFormValidator
//
//  Created by Jeevan on 03/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ValidatorInterface.h"
#import "Field.h"

@interface IsValidDependencyField : NSObject<Validator>

-(instancetype) initWithFirstField:(Field *) firstField;

@end
