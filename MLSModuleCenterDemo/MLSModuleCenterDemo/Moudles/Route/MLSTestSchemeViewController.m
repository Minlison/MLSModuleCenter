//
//  MLSTestSchemeViewController.m
//  MLSModuleCenterDemo
//
//  Created by yuanhang on 2019/10/9.
//  Copyright © 2019 minlison. All rights reserved.
//

#import "MLSTestSchemeViewController.h"
#import <MLSModuleCenter/MLSModuleCenter.h>
@interface MLSTestSchemeViewController ()

@end
#define mls_custom_scheme
@MLSRouteRegister(tt_b, MLSTestSchemeViewController, mls_custom_scheme, 1, "/testPath/scheme", "routeParams")
@implementation MLSTestSchemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)routeParams:(NSDictionary *)routeParams {
  
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc
{
    NSLog(@"dealloc %@",NSStringFromClass(self.class));
}
@end
