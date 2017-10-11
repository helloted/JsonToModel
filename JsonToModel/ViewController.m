//
//  ViewController.m
//  JsonToModel
//
//  Created by iMac on 2017/8/9.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "NSObject+JsonToModel.h"
#import "MapperUser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testMapper];
    
}

- (void)testMapper{
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"testJson" ofType:nil];
    NSString *jsonStr = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    
    MapperUser *user = [MapperUser ht_modelFromJson:jsonStr];
    
    NSLog(@"%@",user.realName);
    NSLog(@"%f",user.height);
}

- (void)testNormal{
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"testJson" ofType:nil];
    NSString *jsonStr = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    
    User *user = [User ht_modelFromJson:jsonStr];
    
    NSLog(@"%f",user.height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
