# BHModuleProtocol Protocol Reference

&nbsp;&nbsp;**Conforms to** NSObject  
&nbsp;&nbsp;**Declared in** BHModuleProtocol.h  

## Overview

Created by <a href="../Classes/BeeHive.html">BeeHive</a>.
Copyright &copy; 2016, Alibaba, Inc. All rights reserved.

This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.

## Tasks

### 

[&ndash;&nbsp;basicModuleLevel](#//api/name/basicModuleLevel)  

[&ndash;&nbsp;modulePriority](#//api/name/modulePriority)  

[&ndash;&nbsp;async](#//api/name/async)  

[&ndash;&nbsp;modSetUp:](#//api/name/modSetUp:)  

[&ndash;&nbsp;modInit:](#//api/name/modInit:)  

[&ndash;&nbsp;modSplash:](#//api/name/modSplash:)  

[&ndash;&nbsp;modQuickAction:](#//api/name/modQuickAction:)  

[&ndash;&nbsp;modTearDown:](#//api/name/modTearDown:)  

[&ndash;&nbsp;modWillResignActive:](#//api/name/modWillResignActive:)  

[&ndash;&nbsp;modDidEnterBackground:](#//api/name/modDidEnterBackground:)  

[&ndash;&nbsp;modWillEnterForeground:](#//api/name/modWillEnterForeground:)  

[&ndash;&nbsp;modDidBecomeActive:](#//api/name/modDidBecomeActive:)  

[&ndash;&nbsp;modWillTerminate:](#//api/name/modWillTerminate:)  

[&ndash;&nbsp;modUnmount:](#//api/name/modUnmount:)  

[&ndash;&nbsp;modOpenURL:](#//api/name/modOpenURL:)  

[&ndash;&nbsp;modDidReceiveMemoryWaring:](#//api/name/modDidReceiveMemoryWaring:)  

[&ndash;&nbsp;modDidFailToRegisterForRemoteNotifications:](#//api/name/modDidFailToRegisterForRemoteNotifications:)  

[&ndash;&nbsp;modDidRegisterForRemoteNotifications:](#//api/name/modDidRegisterForRemoteNotifications:)  

[&ndash;&nbsp;modDidReceiveRemoteNotification:](#//api/name/modDidReceiveRemoteNotification:)  

[&ndash;&nbsp;modDidReceiveLocalNotification:](#//api/name/modDidReceiveLocalNotification:)  

[&ndash;&nbsp;modWillPresentNotification:](#//api/name/modWillPresentNotification:)  

[&ndash;&nbsp;modDidReceiveNotificationResponse:](#//api/name/modDidReceiveNotificationResponse:)  

[&ndash;&nbsp;modWillContinueUserActivity:](#//api/name/modWillContinueUserActivity:)  

[&ndash;&nbsp;modContinueUserActivity:](#//api/name/modContinueUserActivity:)  

[&ndash;&nbsp;modDidFailToContinueUserActivity:](#//api/name/modDidFailToContinueUserActivity:)  

[&ndash;&nbsp;modDidUpdateContinueUserActivity:](#//api/name/modDidUpdateContinueUserActivity:)  

[&ndash;&nbsp;modHandleWatchKitExtensionRequest:](#//api/name/modHandleWatchKitExtensionRequest:)  

[&ndash;&nbsp;modDidCustomEvent:](#//api/name/modDidCustomEvent:)  

[&ndash;&nbsp;modHandleBackgroundSession:](#//api/name/modHandleBackgroundSession:)  

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/async" title="async"></a>
### async

`- (BOOL)async`

<a name="//api/name/basicModuleLevel" title="basicModuleLevel"></a>
### basicModuleLevel

`- (void)basicModuleLevel`

<a name="//api/name/modContinueUserActivity:" title="modContinueUserActivity:"></a>
### modContinueUserActivity:

`- (void)modContinueUserActivity:(BHContext *)*context*`

<a name="//api/name/modDidBecomeActive:" title="modDidBecomeActive:"></a>
### modDidBecomeActive:

`- (void)modDidBecomeActive:(BHContext *)*context*`

<a name="//api/name/modDidCustomEvent:" title="modDidCustomEvent:"></a>
### modDidCustomEvent:

`- (void)modDidCustomEvent:(BHContext *)*context*`

<a name="//api/name/modDidEnterBackground:" title="modDidEnterBackground:"></a>
### modDidEnterBackground:

`- (void)modDidEnterBackground:(BHContext *)*context*`

<a name="//api/name/modDidFailToContinueUserActivity:" title="modDidFailToContinueUserActivity:"></a>
### modDidFailToContinueUserActivity:

`- (void)modDidFailToContinueUserActivity:(BHContext *)*context*`

<a name="//api/name/modDidFailToRegisterForRemoteNotifications:" title="modDidFailToRegisterForRemoteNotifications:"></a>
### modDidFailToRegisterForRemoteNotifications:

`- (void)modDidFailToRegisterForRemoteNotifications:(BHContext *)*context*`

<a name="//api/name/modDidReceiveLocalNotification:" title="modDidReceiveLocalNotification:"></a>
### modDidReceiveLocalNotification:

`- (void)modDidReceiveLocalNotification:(BHContext *)*context*`

<a name="//api/name/modDidReceiveMemoryWaring:" title="modDidReceiveMemoryWaring:"></a>
### modDidReceiveMemoryWaring:

`- (void)modDidReceiveMemoryWaring:(BHContext *)*context*`

<a name="//api/name/modDidReceiveNotificationResponse:" title="modDidReceiveNotificationResponse:"></a>
### modDidReceiveNotificationResponse:

`- (void)modDidReceiveNotificationResponse:(BHContext *)*context*`

<a name="//api/name/modDidReceiveRemoteNotification:" title="modDidReceiveRemoteNotification:"></a>
### modDidReceiveRemoteNotification:

`- (void)modDidReceiveRemoteNotification:(BHContext *)*context*`

<a name="//api/name/modDidRegisterForRemoteNotifications:" title="modDidRegisterForRemoteNotifications:"></a>
### modDidRegisterForRemoteNotifications:

`- (void)modDidRegisterForRemoteNotifications:(BHContext *)*context*`

<a name="//api/name/modDidUpdateContinueUserActivity:" title="modDidUpdateContinueUserActivity:"></a>
### modDidUpdateContinueUserActivity:

`- (void)modDidUpdateContinueUserActivity:(BHContext *)*context*`

<a name="//api/name/modHandleBackgroundSession:" title="modHandleBackgroundSession:"></a>
### modHandleBackgroundSession:

`- (void)modHandleBackgroundSession:(BHContext *)*context*`

<a name="//api/name/modHandleWatchKitExtensionRequest:" title="modHandleWatchKitExtensionRequest:"></a>
### modHandleWatchKitExtensionRequest:

`- (void)modHandleWatchKitExtensionRequest:(BHContext *)*context*`

<a name="//api/name/modInit:" title="modInit:"></a>
### modInit:

`- (void)modInit:(BHContext *)*context*`

<a name="//api/name/modOpenURL:" title="modOpenURL:"></a>
### modOpenURL:

`- (void)modOpenURL:(BHContext *)*context*`

<a name="//api/name/modQuickAction:" title="modQuickAction:"></a>
### modQuickAction:

`- (void)modQuickAction:(BHContext *)*context*`

<a name="//api/name/modSetUp:" title="modSetUp:"></a>
### modSetUp:

`- (void)modSetUp:(BHContext *)*context*`

<a name="//api/name/modSplash:" title="modSplash:"></a>
### modSplash:

`- (void)modSplash:(BHContext *)*context*`

<a name="//api/name/modTearDown:" title="modTearDown:"></a>
### modTearDown:

`- (void)modTearDown:(BHContext *)*context*`

<a name="//api/name/modUnmount:" title="modUnmount:"></a>
### modUnmount:

`- (void)modUnmount:(BHContext *)*context*`

<a name="//api/name/modWillContinueUserActivity:" title="modWillContinueUserActivity:"></a>
### modWillContinueUserActivity:

`- (void)modWillContinueUserActivity:(BHContext *)*context*`

<a name="//api/name/modWillEnterForeground:" title="modWillEnterForeground:"></a>
### modWillEnterForeground:

`- (void)modWillEnterForeground:(BHContext *)*context*`

<a name="//api/name/modWillPresentNotification:" title="modWillPresentNotification:"></a>
### modWillPresentNotification:

`- (void)modWillPresentNotification:(BHContext *)*context*`

<a name="//api/name/modWillResignActive:" title="modWillResignActive:"></a>
### modWillResignActive:

`- (void)modWillResignActive:(BHContext *)*context*`

<a name="//api/name/modWillTerminate:" title="modWillTerminate:"></a>
### modWillTerminate:

`- (void)modWillTerminate:(BHContext *)*context*`

<a name="//api/name/modulePriority" title="modulePriority"></a>
### modulePriority

`- (NSInteger)modulePriority`

