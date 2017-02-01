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
        
 
        //TODO : Better implementation
        if ([self viewWithTag:0]) {
            
            self.viewWrapperField = [[ViewWrapperFactory new] getViewWrapper:[UITextField new]];
            
        }
        else{
            
            self.viewWrapperField = [[ViewWrapperFactory new] getViewWrapper:[UITextView new]];
        }
        
        self.validationFieldsArray = [[NSMutableArray alloc] init];
    }
    return  self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self) {
        self.viewWrapperField.getView.frame = rect;
        self.viewWrapperField.getView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.viewWrapperField.getView];
    }
}

-(void) showErrorBackground {
    self.viewWrapperField.getView.backgroundColor = [UIColor orangeColor];
}

-(void) hideErrorBackground {
    self.viewWrapperField.getView.backgroundColor = [UIColor lightGrayColor];
}

@end
