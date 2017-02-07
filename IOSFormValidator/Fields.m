//
//  Fields.m
//  IOSFormValidator
//
//  Created by Jeevan on 04/02/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import "Fields.h"

@implementation Fields


-(instancetype) initWithField:(Field *) firstField andDependenctyField:(Field *) dependencyField {
 
    if (self = [super init]) {
        
        self.firstField = firstField;
        self.dependencyField = dependencyField;
    }

    return self;
}

@end
