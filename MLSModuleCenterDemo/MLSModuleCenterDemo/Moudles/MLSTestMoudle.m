//
//  MLSTestMoudle.m
//  MLSModuleCenter
//
//  Created by MinLison on 2019/3/1.
//  Copyright © 2019 MinLison. All rights reserved.
//

#import "MLSTestMoudle.h"

/**
 模块：
 该类的作用，主要是能够接收到 AppDelegate 中的方法，BeeHive中有实现
 如果主工程的AppDelegate没有继承 MLSAppDelegate， 请在
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 方法中添加下面两句代码
 [[BHModuleManager sharedManager] triggerEvent:BHMSetupEvent];
 [[BHModuleManager sharedManager] triggerEvent:BHMInitEvent];
 这样只执行 modSetUp 和 modInit 两个初试化方法，其余方法不监听
 使用宏定义 MLS_MOUDLE_REGISTER 注册模块
 */

@MLS_MOUDLE_REGISTER(MLSTestMoudle)
@implementation MLSTestMoudle
- (void)modSetUp:(BHContext *)context {
    /// 在此处可做一些模块设置的操作，比如模块网络层配置等
    
}
- (void)modInit:(BHContext *)context {
    
}
@end
