//
//  User.h
//  JsonToModel
//
//  Created by iMac on 2017/8/9.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
//@property (assign, nonatomic) NSUInteger age;
@property (assign, nonatomic) double height;
@property (strong, nonatomic) NSNumber *money;

@property (nonatomic, strong)NSArray *add;
@property (nonatomic, strong)NSArray *adds;
@property (nonatomic, strong)NSDictionary *dddd;
@property (nonatomic, strong)NSMutableDictionary *dd;

@end
