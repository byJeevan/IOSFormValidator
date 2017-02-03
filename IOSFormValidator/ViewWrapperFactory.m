//
//  ViewWrapperFactory.m
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "ViewWrapperFactory.h"
#import "UITextFieldViewWrapper.h"

@implementation ViewWrapperFactory

-(ViewWrapper *) getViewWrapper:(UIView *) view {
    
    if ([view isKindOfClass:UITextField.class]) {
        
        return  [[UITextFieldViewWrapper alloc] initWithView:view];
    }
    else  if ([view isKindOfClass:UITextView.class]) {
        
//        return  [[UISpinnerViewWrapper alloc] initWithView:view];
    }
    
    NSLog(@"ViewWrapper Class not matching !");
    
    return [ViewWrapper new];
}

@end
