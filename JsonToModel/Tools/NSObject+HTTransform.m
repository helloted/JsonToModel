//
//  NSObject+HTTransform.m
//  JsonToModel
//
//  Created by iMac on 2017/8/8.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "NSObject+HTTransform.h"
#import <objc/runtime.h>

@implementation NSObject (HTTransform)

+(instancetype)ht_objectWithDictionary:(NSDictionary *)dict{
    id theObj = [[self alloc] init];
    
    //获取当前类中的所有属性
    unsigned int propertyCount;
    objc_property_t *allPropertys = class_copyPropertyList([self class], &propertyCount);
    
    for (NSInteger i = 0; i < propertyCount; i ++) {
        objc_property_t property = allPropertys[i];
        
        //拿到属性名称和类型
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        NSString *type = [self getProperyType:property];

        id value = [dict objectForKey:name];
        
        if (value == nil) {
            continue;
        }
        
        [theObj willChangeValueForKey:name];
        [theObj setValue:value forKey:name];
        [theObj didChangeValueForKey:name];
        
        
//        NSLog(@"-%@-%@",name,type);
    }
    
    return theObj;
}


+(NSString *)getProperyType:(objc_property_t)property{
    //得到的是一个类似于T@"NSString",C,N,V_name 这样的一个字符串
    NSString *attributeStr = [NSString stringWithUTF8String:property_getAttributes(property)];
    NSLog(@"%@",attributeStr);
    
    //取出类型名
    NSArray  *array = [attributeStr componentsSeparatedByString:@","];
    NSString *typeStr = [array firstObject];
    
    if ([attributeStr containsString:@"T@\"NSString\""]){
        return @"NSString";
    }else if ([attributeStr containsString:@"T@\"NSNumber\""]){
        return @"NSNumber";
    }else if ([attributeStr containsString:@"Ti"]){
        return @"int";
    }else if ([attributeStr containsString:@"Tq"]){
        return @"NSInteger";
    }else if ([attributeStr containsString:@"TQ"]){
        return @"NSUInteger";
    }else if ([attributeStr containsString:@"Td"]){
        return @"double";
    }else if ([attributeStr containsString:@"Tf"]){
        return @"float";
    }else if ([attributeStr containsString:@"T^B"]){
        return @"BOOL";
    }
    return typeStr;
}

@end
