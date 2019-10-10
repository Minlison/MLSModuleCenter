# BHContext Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Conforms to** NSCopying  
&nbsp;&nbsp;**Declared in** BHContext.h  

## Overview

Created by <a href="../Classes/BeeHive.html">BeeHive</a>.
Copyright &copy; 2016, Alibaba, Inc. All rights reserved.

This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.

## Tasks

### 

[&nbsp;&nbsp;env](#//api/name/env) *property* 

[&nbsp;&nbsp;config](#//api/name/config) *property* 

[&nbsp;&nbsp;appkey](#//api/name/appkey) *property* 

[&nbsp;&nbsp;customEvent](#//api/name/customEvent) *property* 

[&nbsp;&nbsp;application](#//api/name/application) *property* 

[&nbsp;&nbsp;launchOptions](#//api/name/launchOptions) *property* 

[&nbsp;&nbsp;moduleConfigName](#//api/name/moduleConfigName) *property* 

[&nbsp;&nbsp;serviceConfigName](#//api/name/serviceConfigName) *property* 

[&nbsp;&nbsp;touchShortcutItem](#//api/name/touchShortcutItem) *property* 

[&nbsp;&nbsp;openURLItem](#//api/name/openURLItem) *property* 

[&nbsp;&nbsp;notificationsItem](#//api/name/notificationsItem) *property* 

[&nbsp;&nbsp;userActivityItem](#//api/name/userActivityItem) *property* 

[&nbsp;&nbsp;watchItem](#//api/name/watchItem) *property* 

[&nbsp;&nbsp;backgroundItem](#//api/name/backgroundItem) *property* 

[&nbsp;&nbsp;customParam](#//api/name/customParam) *property* 

[+&nbsp;shareInstance](#//api/name/shareInstance)  

[&ndash;&nbsp;addServiceWithImplInstance:serviceName:](#//api/name/addServiceWithImplInstance:serviceName:)  

[&ndash;&nbsp;removeServiceWithServiceName:](#//api/name/removeServiceWithServiceName:)  

[&ndash;&nbsp;getServiceInstanceFromServiceName:](#//api/name/getServiceInstanceFromServiceName:)  

## Properties

<a name="//api/name/appkey" title="appkey"></a>
### appkey

`@property (nonatomic, strong) NSString *appkey`

<a name="//api/name/application" title="application"></a>
### application

`@property (nonatomic, strong) UIApplication *application`

<a name="//api/name/backgroundItem" title="backgroundItem"></a>
### backgroundItem

`@property (nonatomic, strong) BHBackgroundItem *backgroundItem`

<a name="//api/name/config" title="config"></a>
### config

`@property (nonatomic, strong) BHConfig *config`

<a name="//api/name/customEvent" title="customEvent"></a>
### customEvent

`@property (nonatomic, assign) NSInteger customEvent`

<a name="//api/name/customParam" title="customParam"></a>
### customParam

`@property (nonatomic, copy) NSDictionary *customParam`

<a name="//api/name/env" title="env"></a>
### env

`@property (nonatomic, assign) BHEnvironmentType env`

<a name="//api/name/launchOptions" title="launchOptions"></a>
### launchOptions

`@property (nonatomic, strong) NSDictionary *launchOptions`

<a name="//api/name/moduleConfigName" title="moduleConfigName"></a>
### moduleConfigName

`@property (nonatomic, strong) NSString *moduleConfigName`

<a name="//api/name/notificationsItem" title="notificationsItem"></a>
### notificationsItem

`@property (nonatomic, strong) BHNotificationsItem *notificationsItem`

<a name="//api/name/openURLItem" title="openURLItem"></a>
### openURLItem

`@property (nonatomic, strong) BHOpenURLItem *openURLItem`

<a name="//api/name/serviceConfigName" title="serviceConfigName"></a>
### serviceConfigName

`@property (nonatomic, strong) NSString *serviceConfigName`

<a name="//api/name/touchShortcutItem" title="touchShortcutItem"></a>
### touchShortcutItem

`@property (nonatomic, strong) BHShortcutItem *touchShortcutItem`

<a name="//api/name/userActivityItem" title="userActivityItem"></a>
### userActivityItem

`@property (nonatomic, strong) BHUserActivityItem *userActivityItem`

<a name="//api/name/watchItem" title="watchItem"></a>
### watchItem

`@property (nonatomic, strong) BHWatchItem *watchItem`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/shareInstance" title="shareInstance"></a>
### shareInstance

`+ (instancetype)shareInstance`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/addServiceWithImplInstance:serviceName:" title="addServiceWithImplInstance:serviceName:"></a>
### addServiceWithImplInstance:serviceName:

`- (void)addServiceWithImplInstance:(id)*implInstance* serviceName:(NSString *)*serviceName*`

<a name="//api/name/getServiceInstanceFromServiceName:" title="getServiceInstanceFromServiceName:"></a>
### getServiceInstanceFromServiceName:

`- (id)getServiceInstanceFromServiceName:(NSString *)*serviceName*`

<a name="//api/name/removeServiceWithServiceName:" title="removeServiceWithServiceName:"></a>
### removeServiceWithServiceName:

`- (void)removeServiceWithServiceName:(NSString *)*serviceName*`

