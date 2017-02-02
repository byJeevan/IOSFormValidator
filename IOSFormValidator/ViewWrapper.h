//
//  ViewWrapper.h
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewWrapper:UIView

-(UIView *) getView;

-(NSString *) getText;

-(void) focusToView;

@end
