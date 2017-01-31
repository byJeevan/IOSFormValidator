//
//  EmainView.m
//  IOSFormValidator
//
//  Created by Jeevan on 31/01/17.
//  Copyright © 2017 com.byjeevan.ios.formvalidator. All rights reserved.
//

#import "EmailView.h"

@implementation EmailView


-(id)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {
     
    }

    return self;
}


-(id) initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self) {
        
        UITextField * emailTextView = [[UITextField alloc] initWithFrame:rect];
        emailTextView.backgroundColor = [UIColor yellowColor];
        [self addSubview:emailTextView];
        
    }
}

@end
