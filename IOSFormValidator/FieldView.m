//
//  PasswordView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import "FieldView.h"

@interface FieldView()
@property (nonatomic, strong) UITextField *passwordTextField;
@end

@implementation FieldView

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.passwordTextField = [[UITextField alloc] init];
    }
    return  self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self) {
        self.passwordTextField.frame = rect;
        self.passwordTextField.backgroundColor = [UIColor grayColor];
        [self addSubview:self.passwordTextField];
    }
}

/**
 * Implementation of form view interface method
 */
-(void) excecuteValidation {
   
    [self highLightFormFields];
}
-(void) highLightFormFields {
    self.passwordTextField.backgroundColor = [UIColor whiteColor];
}

@end
