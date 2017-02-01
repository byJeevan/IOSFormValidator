//
//  ViewWrapperFactory.h
//  IOSFormValidator
//
//  Created by Jeevan on 01/02/17.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewWrapper.h"

@interface ViewWrapperFactory : NSObject

-(ViewWrapper *) getViewWrapper:(UIView *) view;

@end
