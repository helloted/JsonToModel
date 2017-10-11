//
//  NSObject+JsonToModel.h
//  JsonToModel
//
//  Created by iMac on 2017/10/11.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JsonToModel)

+(instancetype)ht_modelFromJson:(id)json;

@end

@protocol JSONAttributesMapperProtocol <NSObject>

@required

+ (NSDictionary *)attributesMapperDictionary;

@end
