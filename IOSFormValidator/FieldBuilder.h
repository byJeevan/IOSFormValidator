//
//  FormBuilder.h
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Field.h"

@interface FieldBuilder : NSObject
@property (nonatomic, strong) UIView *field;
@property (nonatomic, strong) UIView *hintView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) NSArray *validationArray;
@end
