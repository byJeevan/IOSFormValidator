//
//  ValidationButton.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "ValidationButton.h"
#import "FormParentView.h"

@implementation ValidationButton

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addTarget:self action:@selector(didTouchButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return  self;
}

- (void)didTouchButton {
    NSLog(@"Super view class %@", self.superview.class);
    
    //Loop through every fields in the form view,
    for (FormParentView *subview in self.superview.subviews)
    {
        NSLog(@"SUB view class %@", subview);
        
        if ([subview respondsToSelector:@selector(excecuteValidation)]) {
            
            [subview excecuteValidation]; //call interface method for respective element.
            
        }
    }
}

@end
