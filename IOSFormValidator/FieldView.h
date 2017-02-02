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
#import "ErrorButton.h"
#import "ErrorMessageView.h"

@interface FieldView : UIView

@property (nonatomic, strong) ViewWrapper *viewWrapperField;
@property (nonatomic, strong) ErrorButton * errorButton;
@property (nonatomic, strong) ErrorMessageView * errorMessageView;

@property (nonatomic, strong) NSMutableArray * validationFieldsArray;

//+(ViewWrapper *) getViewWrapperFromObject:(id) view;
-(void) showErrorBackground;
-(void) hideErrorBackground;

-(void) showErrorBackgroundWithMessage:(NSString *) message;

@end
