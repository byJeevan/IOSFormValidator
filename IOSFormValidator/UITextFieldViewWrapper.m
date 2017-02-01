//
//  UITextFieldViewWrapper.m
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "UITextFieldViewWrapper.h"

@interface UITextFieldViewWrapper()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation UITextFieldViewWrapper

-(instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        self.textField  = [[UITextField alloc] init];
        
    }
    
    return self;
}


-(NSString *) getText {
    return self.textField.text;
}

-(UIView *) getView {
    return self.textField;
}

@end
