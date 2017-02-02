//
//  Field.h
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewWrapper.h"
#import "FieldBuilder.h"

@class FieldBuilder;

@interface Field : NSObject

@property (nonatomic, strong) ViewWrapper *viewWrapperField;
@property (nonatomic, strong) UIView * errorHintView;
@property (nonatomic, strong) UILabel * errorMessageLabel;
@property (nonatomic, strong) NSArray * validationItemsArray;

+ (instancetype)makeWithBuilder:(void (^)(FieldBuilder *))updateBlock;

-(void) showErrorField:(Field *) field withMessage:(NSString *) message;

-(void) hideErrorField:(Field *) field;

@end
