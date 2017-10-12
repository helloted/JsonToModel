//
//  School.m
//  JsonToModel
//
//  Created by iMac on 2017/10/12.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "School.h"

@implementation School

+ (NSDictionary *)attributesNestDictionary{
    return @{@"user" : NSStringFromClass([User class])};
}

@end
