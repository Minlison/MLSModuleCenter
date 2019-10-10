# BeeHive Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** BeeHive.h  

## Overview

Created by BeeHive.
Copyright &copy; 2016, Alibaba, Inc. All rights reserved.

This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.

## Tasks

### 

[&nbsp;&nbsp;context](#//api/name/context) *property* 

[&nbsp;&nbsp;enableException](#//api/name/enableException) *property* 

[+&nbsp;shareInstance](#//api/name/shareInstance)  

[+&nbsp;registerDynamicModule:](#//api/name/registerDynamicModule:)  

[&ndash;&nbsp;createService:](#//api/name/createService:)  

[&ndash;&nbsp;registerService:service:](#//api/name/registerService:service:)  

[+&nbsp;triggerCustomEvent:](#//api/name/triggerCustomEvent:)  

## Properties

<a name="//api/name/context" title="context"></a>
### context

`@property (nonatomic, strong) BHContext *context`

<a name="//api/name/enableException" title="enableException"></a>
### enableException

`@property (nonatomic, assign) BOOL enableException`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/registerDynamicModule:" title="registerDynamicModule:"></a>
### registerDynamicModule:

`+ (void)registerDynamicModule:(Class)*moduleClass*`

<a name="//api/name/shareInstance" title="shareInstance"></a>
### shareInstance

`+ (instancetype)shareInstance`

<a name="//api/name/triggerCustomEvent:" title="triggerCustomEvent:"></a>
### triggerCustomEvent:

`+ (void)triggerCustomEvent:(NSInteger)*eventType*`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/createService:" title="createService:"></a>
### createService:

`- (id)createService:(Protocol *)*proto*`

<a name="//api/name/registerService:service:" title="registerService:service:"></a>
### registerService:service:

`- (void)registerService:(Protocol *)*proto* service:(Class)*serviceClass*`

