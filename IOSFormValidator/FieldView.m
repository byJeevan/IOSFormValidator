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
        self.textField = [[UITextField alloc] init];
        self.validationFieldsArray = [[NSMutableArray alloc] init];
    }
    return  self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self) {
        self.textField.frame = rect;
        self.textField.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.textField];
    }
}


-(void) showErrorBackground {
    self.textField.backgroundColor = [UIColor orangeColor];
}


-(void) hideErrorBackground {
    self.textField.backgroundColor = [UIColor lightGrayColor];
}

@end
