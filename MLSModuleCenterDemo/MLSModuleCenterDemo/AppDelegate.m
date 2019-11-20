//
//  AppDelegate.m
//  MLSModuleCenterDemo
//
//  Created by yuanhang on 2019/10/9.
//  Copyright © 2019 minlison. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [BHContext shareInstance].application = application;
    [BHContext shareInstance].launchOptions = launchOptions;
    BHContext.shareInstance.env = BHEnvironmentDev;
#if DEBUG
    [BeeHive shareInstance].enableException = YES;
#endif
    /// 配置 BeeHive 上下文
    [[BeeHive shareInstance] setContext:[BHContext shareInstance]];
    
    /// 手动调用moudle
    [[BHModuleManager sharedManager] triggerEvent:BHMSetupEvent];
    [[BHModuleManager sharedManager] triggerEvent:BHMInitEvent];
    
    
#if MLSModuleCenterToolsEnable
    /// 此处必须是模拟器调用,用来生成所有路由头文件
    NSString *rootPath = [NSString stringWithFormat:@"%s", __FILE__];
    rootPath = [rootPath stringByReplacingOccurrencesOfString:[rootPath lastPathComponent] withString:@"Header"];
    BOOL isDir = NO;
    if (![NSFileManager.defaultManager fileExistsAtPath:rootPath isDirectory:&isDir] || !isDir) {
        [NSFileManager.defaultManager createDirectoryAtPath:rootPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSLog(@"%@",rootPath);
    [MLSGenerateRouteHeaderTool generateRoutesHeaderToDir:rootPath headerName:nil];
#endif
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    ViewController *homeVc = [[ViewController alloc] init];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)homeVc];
    //
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navCtrl;
    
    [self.window makeKeyAndVisible];
    return YES;
    return YES;
}

@end
