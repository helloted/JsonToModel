//
//  NSString+HTJson.m
//  JsonToModel
//
//  Created by iMac on 2017/8/9.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "NSString+HTJson.h"

@implementation NSString (HTJson)

- (NSDictionary *)ht_jsonStringToDictionary{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
