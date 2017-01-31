//
//  EmailView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import "EmailView.h"

@interface EmailView() {
    
    
}

@property (nonatomic, strong) UITextField *emailTextField;
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


- (BOOL)isValidEmailAddress {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self.emailTextField.text];
}

-(void) excecuteValidation {
    
    NSLog(@"Field is %d valid", [self isValidEmailAddress]);
    
}

@end
