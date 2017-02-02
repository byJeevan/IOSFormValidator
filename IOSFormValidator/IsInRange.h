//
//  IsInRange.h
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ValidatorInterface.h"

@interface IsInRange : NSObject<Validator>

-(instancetype) initWithMin:(int) min andMax:(int) max;

@end
