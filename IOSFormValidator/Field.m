//
//  Field.m
//  IOSFormValidator
//
//  Created by Jeevan on 02/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "Field.h"
#import "ViewWrapperFactory.h"

@interface Field() 

@end

@implementation Field


-(instancetype) initWithField:(id)editView errorMessageView:(UILabel *) messageLabel errorHintView:(UIView *) hintView validationsArray:(NSArray *) validationsArray {
    
    self = [super init];
    if (self) {
        
        self.viewWrapperField  = [[ViewWrapperFactory new] getViewWrapper:editView];
        
        self.errorMessageLabel = messageLabel;
        
        self.errorHintView  = hintView;
        
        self.validationItemsArray = [[NSArray alloc] initWithArray: validationsArray];
        
        [self initFieldAttributes];
    }

    return self;
}

-(void) initFieldAttributes {
    
    self.errorHintView.hidden = YES;
    
    self.errorMessageLabel.hidden = YES;
    
     //The setup code (in viewDidLoad in your view controller)
     UITapGestureRecognizer *singleFingerTap =
     [[UITapGestureRecognizer alloc] initWithTarget:self
                                             action:@selector(handleSingleTapOnErrorHint:)];
     [self.errorHintView addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTapOnErrorHint:(UITapGestureRecognizer *)recognizer {
    
      if (self.errorHintView.isHidden) {
          //Gaurd - touch event when no error.
          
      }
      else{ //When error view visible
          
          self.errorMessageLabel.hidden = !self.errorMessageLabel.hidden ;
      }
}

-(void) showErrorField:(Field *) field withMessage:(NSString *) message{
    
    self.errorHintView.hidden = NO;
    self.errorMessageLabel.text = message;
}

-(void) hideErrorField:(Field *) field {
    
    self.errorHintView.hidden = YES;
    self.errorMessageLabel.hidden = YES;
}


@end
