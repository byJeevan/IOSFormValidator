//
//  PasswordView.h
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewWrapper.h"
#import "ViewWrapperFactory.h"

@interface FieldView : ViewWrapper

@property (nonatomic, strong) ViewWrapper *viewWrapperField;

@property (nonatomic, strong) NSMutableArray * validationFieldsArray;

-(void) showErrorBackground;

-(void) hideErrorBackground;

@end
