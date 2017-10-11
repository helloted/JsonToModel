//
//  MapperUser.h
//  JsonToModel
//
//  Created by iMac on 2017/10/11.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+JsonToModel.h"

@interface MapperUser : NSObject <JSONAttributesMapperProtocol>

@property (copy, nonatomic) NSString *realName;
@property (copy, nonatomic) NSString *realIcon;
@property (assign, nonatomic) double height;

@end
