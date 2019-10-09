//
//  MLSTestPathParamsViewController.m
//  MLSModuleCenter
//
//  Created by MinLison on 2019/3/1.
//  Copyright © 2019 MinLison. All rights reserved.
//

#import "MLSTestPathParamsViewController.h"
#import <MLSModuleCenter/MLSModuleCenter.h>
@interface MLSTestPathParamsViewController ()

@end

@MLSRouteRegisterDefaultScheme(identifier, MLSTestPathParamsViewController, "/testPath/default/:type")
@implementation MLSTestPathParamsViewController

+ (UIViewController<MLSRouteDefinitionTargetController> *)targetControllerWithParams:(NSDictionary *)parameters {
    MLSTestPathParamsViewController *v =  [[self alloc] init];
    if ([[parameters objectForKey:@"type"] isEqualToString:@"red"]) {
        v.view.backgroundColor = [UIColor redColor];
    }
    return v;
}
- (void)dealloc
{
    NSLog(@"dealloc %@",NSStringFromClass(self.class));
}
@end
