//
//  NSObject+JsonToModel.m
//  JsonToModel
//
//  Created by iMac on 2017/10/11.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "NSObject+JsonToModel.h"
#import <objc/runtime.h>

@implementation NSObject (JsonToModel)

+ (instancetype)ht_modelFromJson:(id)json{
    id model = [[self alloc] init];
    NSDictionary *jsonDict = [self dictionaryWithJSON:json];
    model = [self ht_modelWithDictionary:jsonDict];
    return model;
}


+(instancetype)ht_modelWithDictionary:(NSDictionary *)dict{
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


+ (NSDictionary *)dictionaryWithJSON:(id)json
{
    if (!json) {
        return nil;
    }
    // 若是NSDictionary类型，直接返回
    if ([json isKindOfClass:[NSDictionary class]]) {
        return json;
    }
    
    NSDictionary *dict = nil;
    NSData *jsonData = nil;
    
    // 如果是NSString，就先转化为NSData
    if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    
    // 如果时NSData类型，使用NSJSONSerialization
    if (jsonData && [jsonData isKindOfClass:[NSData class]]) {
        NSError *error = nil;
        dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"dictionaryWithJSON error:%@", error);
            return nil;
        }
        if (![dict isKindOfClass:[NSDictionary class]]) {
            return nil;
        }
    }
    
    return dict;
}

@end
