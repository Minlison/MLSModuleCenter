//
//  ViewController.m
//  MLSModuleCenterDemo
//
//  Created by yuanhang on 2019/10/9.
//  Copyright © 2019 minlison. All rights reserved.
//

#import "ViewController.h"
#import <SwiftUI/SwiftUI.h>
#import "MLSRouteHeader.h"
#import <MLSModuleCenter/MLSModuleCenter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.darkGrayColor;
    UIButton *testDefaultBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 200, 50)];
    [testDefaultBtn setTitle:@"测试默认路由" forState:(UIControlStateNormal)];
    [testDefaultBtn addTarget:self action:@selector(testDefault) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:testDefaultBtn];
    
    UIButton *testDefaultPath = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, 200, 50)];
    [testDefaultPath setTitle:@"测试默认路由带参数" forState:(UIControlStateNormal)];
    [testDefaultPath addTarget:self action:@selector(testDefaultPath) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:testDefaultPath];
    
}

- (void)testDefault {
    id obj = [self routeObjForURL:[NSURL URLForRouteTestDefault] withParameters:nil];
    [self.navigationController pushViewController:obj animated:YES];
    
//    [self routeURL:[NSURL URLForRouteTestDefault] withParameters:nil handler:^BOOL(NSMutableDictionary<NSString *,id> * _Nullable parameters, id targetObj) {
//        [self.navigationController pushViewController:targetObj animated:YES];
//        return YES;
//    }];
}
- (void)testDefaultPath {
    [self routeURL:[NSURL URLForRouteTestPathDefaultType:@"red"] withParameters:nil handler:^BOOL(NSMutableDictionary<NSString *,id> * _Nullable parameters, id targetObj) {
        [self.navigationController pushViewController:targetObj animated:YES];
        return YES;
    }];
}


@end
