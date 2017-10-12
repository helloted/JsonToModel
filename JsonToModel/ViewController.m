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
    
    [self testNormal];
    
}

- (void)testMapper{
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"testJson" ofType:nil];
    NSString *jsonStr = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    
    MapperUser *user = [MapperUser ht_modelFromJson:jsonStr];
    
    NSLog(@"%@",user.realName);
//    NSLog(@"%f",user.height);
}

- (void)testNormal{
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"testJson" ofType:nil];
    NSString *jsonStr = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    
    User *user = [[User alloc]init];
//    user.height = 0.1;
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//
//
//    [user addObserver:self forKeyPath:@"height" options:
//     NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
//
//
//    view.frame = CGRectMake(0, 100, 100, 100);
    
    user = [User ht_modelFromJson:jsonStr];
    [user addObserver:self forKeyPath:@"height" options:NSKeyValueObservingOptionNew context:nil];
    
     [user updateModelWithJson:jsonStr];
    

    
////
    CGFloat a = user.height + 10.1;
////
//    NSLog(@"add--%f",a);
////
    user.height = 100.0000;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"---changed------");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
