//
//  PasswordView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import "PasswordView.h"

@interface PasswordView()

@property (nonatomic, strong) UITextField *passwordTextField;

@end

@implementation PasswordView

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


- (BOOL)isEmpty {
    
    return  self.passwordTextField.text.length > 0 ? YES : NO;
}


-(void) excecuteValidation {
    
    NSLog(@"Field is %d valid", [self isEmpty]);
    
}


@end
