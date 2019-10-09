//
//  MLSTestDefaultViewController.m
//  MLSModuleCenter
//
//  Created by MinLison on 2019/3/1.
//  Copyright © 2019 MinLison. All rights reserved.
//

#import "MLSTestDefaultViewController.h"
#import <MLSModuleCenter/MLSModuleCenter.h>
@interface MLSTestDefaultViewController ()

@end

@MLSRouteRegisterDefaultScheme(identifier, MLSTestDefaultViewController, "/test/default")
@implementation MLSTestDefaultViewController
+ (UIViewController<MLSRouteDefinitionTargetController> *)targetControllerWithParams:(NSDictionary *)parameters {
    MLSTestDefaultViewController *v = [[self alloc] init];
    v.view.backgroundColor = [UIColor blueColor];
    return v;
}
- (void)dealloc
{
    NSLog(@"dealloc %@",NSStringFromClass(self.class));
}
@end
