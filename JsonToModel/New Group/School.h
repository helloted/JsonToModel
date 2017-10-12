//
//  School.h
//  JsonToModel
//
//  Created by iMac on 2017/10/12.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "NSObject+JsonToModel.h"

@interface School : NSObject <JSONModelSpecialAttributesProtocol>

@property (nonatomic, copy)NSString   *address;
@property (nonatomic, strong)User     *user;

@end
