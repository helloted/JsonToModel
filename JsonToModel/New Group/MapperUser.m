//
//  MapperUser.m
//  JsonToModel
//
//  Created by iMac on 2017/10/11.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "MapperUser.h"

@implementation MapperUser

+(NSDictionary *)attributesMapperDictionary{
    return @{@"realName" : @"name",
             @"realIcon" : @"icon"};
}

@end
