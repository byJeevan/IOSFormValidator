//
//  UISpinnerViewWrapper.m
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "UISpinnerViewWrapper.h"

@interface UISpinnerViewWrapper()

@property (nonatomic, strong) UITextView *textView;

@end

@implementation UISpinnerViewWrapper

-(instancetype) initWithView:(UIView *) view {
    
    self = [super init];
    
    if (self) {
        
        self.textView  = (UITextView *) view;
        
    }
    
    return self;
}


-(NSString *) getText {
    return self.textView.text;
}

-(UIView *) getView {
    return self.textView;
}


-(void) focusToView{
    
    [self.textView becomeFirstResponder];
}

@end
