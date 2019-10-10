# BHServiceManager Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** BHServiceManager.h  

## Overview

Created by <a href="../Classes/BeeHive.html">BeeHive</a>.
Copyright &copy; 2016, Alibaba, Inc. All rights reserved.

This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.

## Tasks

### 

[&nbsp;&nbsp;enableException](#//api/name/enableException) *property* 

[+&nbsp;sharedManager](#//api/name/sharedManager)  

[&ndash;&nbsp;registerLocalServices](#//api/name/registerLocalServices)  

[&ndash;&nbsp;registerService:implClass:](#//api/name/registerService:implClass:)  

[&ndash;&nbsp;createService:](#//api/name/createService:)  

[&ndash;&nbsp;createService:withServiceName:](#//api/name/createService:withServiceName:)  

[&ndash;&nbsp;createService:withServiceName:shouldCache:](#//api/name/createService:withServiceName:shouldCache:)  

[&ndash;&nbsp;getServiceInstanceFromServiceName:](#//api/name/getServiceInstanceFromServiceName:)  

[&ndash;&nbsp;removeServiceWithServiceName:](#//api/name/removeServiceWithServiceName:)  

## Properties

<a name="//api/name/enableException" title="enableException"></a>
### enableException

`@property (nonatomic, assign) BOOL enableException`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/sharedManager" title="sharedManager"></a>
### sharedManager

`+ (instancetype)sharedManager`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/createService:" title="createService:"></a>
### createService:

`- (id)createService:(Protocol *)*service*`

<a name="//api/name/createService:withServiceName:" title="createService:withServiceName:"></a>
### createService:withServiceName:

`- (id)createService:(Protocol *)*service* withServiceName:(NSString *)*serviceName*`

<a name="//api/name/createService:withServiceName:shouldCache:" title="createService:withServiceName:shouldCache:"></a>
### createService:withServiceName:shouldCache:

`- (id)createService:(Protocol *)*service* withServiceName:(NSString *)*serviceName* shouldCache:(BOOL)*shouldCache*`

<a name="//api/name/getServiceInstanceFromServiceName:" title="getServiceInstanceFromServiceName:"></a>
### getServiceInstanceFromServiceName:

`- (id)getServiceInstanceFromServiceName:(NSString *)*serviceName*`

<a name="//api/name/registerLocalServices" title="registerLocalServices"></a>
### registerLocalServices

`- (void)registerLocalServices`

<a name="//api/name/registerService:implClass:" title="registerService:implClass:"></a>
### registerService:implClass:

`- (void)registerService:(Protocol *)*service* implClass:(Class)*implClass*`

<a name="//api/name/removeServiceWithServiceName:" title="removeServiceWithServiceName:"></a>
### removeServiceWithServiceName:

`- (void)removeServiceWithServiceName:(NSString *)*serviceName*`

