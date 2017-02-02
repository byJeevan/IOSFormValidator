//
//  UISpinnerViewWrapper.h
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewWrapper.h"

@interface UISpinnerViewWrapper : ViewWrapper

-(instancetype) initWithView:(UIView *) view;

-(UIView *) getView;

-(NSString *) getText;
@end
