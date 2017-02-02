//
//  PasswordView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import "FieldView.h"

@interface FieldView()

@end

@implementation FieldView

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        NSLog(@"FieldView item detect : ----- > %@", self);
        
        //Looping "View" subclass.
        for (UIView *subview in self.subviews)
        {
            /*
             *Replacing with ViewWrapper.
             */
            self.viewWrapperField = [[ViewWrapperFactory new] getViewWrapper:subview];
            [subview removeFromSuperview];
        }
        
        self.validationFieldsArray = [[NSMutableArray alloc] init];
        self.errorButton = [ErrorButton new];
        self.errorMessageView = [ErrorMessageView new];
        
    }
    
    return  self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self) {
        
        self.viewWrapperField.getView.frame = rect;
        //     self.viewWrapperField.getView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.viewWrapperField.getView];
        
        //Error button
        self.errorButton.frame = CGRectMake(rect.size.width - 15, rect.size.height/2.0 - 15, 30, 30);
        [self addSubview:self.errorButton];
        [self.errorButton addTarget:self action:@selector(didTouchButton) forControlEvents:UIControlEventTouchUpInside];
        self.errorButton.hidden = YES;
        
        [self.errorButton setSelected:NO];
        
        //Error message view
        self.errorMessageView.frame = CGRectMake(0, rect.size.height, rect.size.width, 40);
        self.errorMessageView.hidden = YES;
//        [self.errorMessageView sizeToFit]
        [self addSubview:self.errorMessageView];
        
        
    }
}

-(void) didTouchButton {
    
    if (!self.errorButton.isHidden) {
        
        
        if(self.errorButton.isSelected) {
            
            self.errorMessageView.hidden = YES;
//            self.viewWrapperField.getView.backgroundColor = [UIColor lightGrayColor];
            [self.errorButton setSelected:NO];
    
        }
        else{
            self.errorMessageView.hidden = NO;
            
          
//            self.viewWrapperField.getView.backgroundColor = [UIColor orangeColor];
            
            [self.errorButton setSelected:YES];
            
            
        }
    }
    else{
        
    }

}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
        for (UIView *subview in self.subviews.reverseObjectEnumerator) {
            CGPoint subPoint = [subview convertPoint:point fromView:self];
            UIView *result = [subview hitTest:subPoint withEvent:event];
            if (result != nil) {
                return result;
            }
        }
    }
    
    return nil;
}


-(void) hideErrorBackground {
    self.errorButton.hidden = YES;
     self.errorMessageView.hidden = YES;
}

-(void) showErrorBackground {
    self.errorButton.hidden = NO;
    
}

-(void) showErrorBackgroundWithMessage:(NSString *) message {
    self.errorButton.hidden = NO;
    self.errorMessageView.text = message;
}

@end
