//
//  User.m
//  JsonToModel
//
//  Created by iMac on 2017/8/9.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "User.h"

@implementation User

- (void)setHeight:(double)height{
    _height = 100.001;
}

- (void)setName:(NSString *)name{
    _name = [NSString stringWithFormat:@"my name is %@",name];
}


@end
