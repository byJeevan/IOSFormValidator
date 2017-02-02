//
//  ErrorButton.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "ErrorButton.h"

@implementation ErrorButton


-(instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        [self addTarget:self action:@selector(didTouchButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
  
}


-(void) didTouchButton {
    
}



@end
