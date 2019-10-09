//
//  MLSModule.m
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import "MLSBaseModule.h"

@implementation MLSModule

- (void)modSetUp:(BHContext *)context{}

- (void)modInit:(BHContext *)context{}

- (void)modSplash:(BHContext *)context{}

- (void)modQuickAction:(BHContext *)context{}

- (void)modTearDown:(BHContext *)context{}

- (void)modWillResignActive:(BHContext *)context{}

- (void)modDidEnterBackground:(BHContext *)context{}

- (void)modWillEnterForeground:(BHContext *)context{}

- (void)modDidBecomeActive:(BHContext *)context{}

- (void)modWillTerminate:(BHContext *)context{}

- (void)modUnmount:(BHContext *)context{}

- (void)modOpenURL:(BHContext *)context{}

- (void)modDidReceiveMemoryWaring:(BHContext *)context{}

- (void)modDidFailToRegisterForRemoteNotifications:(BHContext *)context{}

- (void)modDidRegisterForRemoteNotifications:(BHContext *)context{}

- (void)modDidReceiveRemoteNotification:(BHContext *)context{}

- (void)modDidReceiveLocalNotification:(BHContext *)context{}

- (void)modWillPresentNotification:(BHContext *)context{}

- (void)modDidReceiveNotificationResponse:(BHContext *)context{}

- (void)modWillContinueUserActivity:(BHContext *)context{}

- (void)modContinueUserActivity:(BHContext *)context{}

- (void)modDidFailToContinueUserActivity:(BHContext *)context{}

- (void)modDidUpdateContinueUserActivity:(BHContext *)context{}

- (void)modDidHandleBackSectionTask:(BHContext *)context {}

- (void)modDidCustomEvent:(BHContext *)context{}

- (void)modHandleBackgroundSession:(BHContext *)context {}
@end

@implementation MLSBaseModule
@end
