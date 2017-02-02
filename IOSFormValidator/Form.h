//
//  Form.h
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Field.h"

@interface Form : NSObject

@property (nonatomic,strong) NSMutableArray * fields;

-(void) addNewField:(Field *) field;

-(BOOL) isFormValid;

@end
