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

-(instancetype) initWithView:(UIView *) view {
    self = [super init];
    if (self) {
        self.textField  = (UITextField *) view;
    }
    return self;
}

-(NSString *) getText {
    return self.textField.text;
}

-(UIView *) getView {
    return self.textField;
}

-(void) focusToView {
    
    [self.textField becomeFirstResponder];
}

-(void) metaDataDictionary:(NSDictionary *) metaDataDictionary {
    
    
}

@end
