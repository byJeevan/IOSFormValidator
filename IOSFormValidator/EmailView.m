//
//  EmailView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import "EmailView.h"

@interface EmailView()

@end

@implementation EmailView

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.emailTextField = [[UITextField alloc] init];
    }
    return  self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self) {
        self.emailTextField.frame = rect;
        self.emailTextField.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.emailTextField];
    }
}

/**
 * Method implementation of Form View interface
 */
-(void) excecuteValidation {
    if ([self isEmpty]) {
        NSLog(@"Email Field is empty");
    }
    else{
        if ([self isValidEmailAddress]) {
            NSLog(@"Email Field is Valid");
        }
        else {
            NSLog(@"Email Field is not Valid");
        }
    }
        [self highLightFormFields];
}

-(void) highLightFormFields {
    
     self.emailTextField.backgroundColor = [UIColor whiteColor];
    
     if ([self isEmpty] || ![self isValidEmailAddress]) {
     
         self.emailTextField.backgroundColor = [UIColor orangeColor];
     }
}

/**
 * Validation Methods
 */

- (BOOL)isValidEmailAddress {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self.emailTextField.text];
}

-(BOOL) isEmpty {
    return self.emailTextField.text.length > 0? NO:YES;
}

@end
