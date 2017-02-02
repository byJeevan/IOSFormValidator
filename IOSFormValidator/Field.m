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

- (instancetype)init {
    FieldBuilder *builder = [FieldBuilder new];
    return [self initWithBuilder:builder];
}

+ (instancetype)makeWithBuilder:(void (^)(FieldBuilder *))updateBlock {
    FieldBuilder *builder = [FieldBuilder new];
    updateBlock(builder);
    return [[Field alloc] initWithBuilder:builder];
}

-(instancetype)initWithBuilder:(FieldBuilder *)builder
{
    self = [super init];
    if (self) {
 
        self.viewWrapperField  = [[ViewWrapperFactory new] getViewWrapper: builder.field];
        
        self.errorMessageLabel = builder.messageLabel;
        
        self.errorHintView  = builder.hintView;
        
        self.validationItemsArray = [[NSArray alloc] initWithArray: builder.validationArray];
        
        [self initFieldAttributes];
        
    }
    
    return self;
}

- (FieldBuilder *)makeBuilder {
    
    FieldBuilder *builder = [FieldBuilder new];
    
    builder.field =     self.viewWrapperField;
    
    builder.messageLabel=   self.errorMessageLabel;
    
    builder.hintView =  self.errorHintView ;
    
    builder.validationArray  =   self.validationItemsArray;
    
    return builder;
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
