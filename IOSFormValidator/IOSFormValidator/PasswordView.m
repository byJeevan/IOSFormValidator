//
//  PasswordView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import "PasswordView.h"

@implementation PasswordView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // Drawing code
    if (self) {
        
        UITextField * passwordField = [[UITextField alloc] initWithFrame:rect];
        passwordField.backgroundColor = [UIColor grayColor];
        [self addSubview:passwordField];
        
    }
}


@end
