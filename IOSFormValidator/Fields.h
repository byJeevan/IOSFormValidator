//
//  Fields.h
//  IOSFormValidator
//
//  Created by Jeevan on 04/02/2017.
//  Copyright © 2017 byjeevan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Field.h"

@interface Fields : NSObject

@property (nonatomic,strong) Field * firstField;
@property (nonatomic,strong) Field * dependencyField;


-(instancetype) initWithField:(Field *) firstField andDependenctyField:(Field *) dependencyField;

@end
