# BHTimeProfiler Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** BHTimeProfiler.h  

## Overview

Created by <a href="../Classes/BeeHive.html">BeeHive</a>.
Copyright &copy; 2016, Alibaba, Inc. All rights reserved.

This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.

## Tasks

### 

[+&nbsp;sharedTimeProfiler](#//api/name/sharedTimeProfiler)  

[&ndash;&nbsp;initTimeProfilerWithMainKey:](#//api/name/initTimeProfilerWithMainKey:)  

[&ndash;&nbsp;recordEventTime:](#//api/name/recordEventTime:)  

[&ndash;&nbsp;printOutTimeProfileResult](#//api/name/printOutTimeProfileResult)  

[&ndash;&nbsp;saveTimeProfileDataIntoFile:](#//api/name/saveTimeProfileDataIntoFile:)  

[&ndash;&nbsp;postTimeProfileResultNotification](#//api/name/postTimeProfileResultNotification)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/sharedTimeProfiler" title="sharedTimeProfiler"></a>
### sharedTimeProfiler

`+ (BHTimeProfiler *)sharedTimeProfiler`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/initTimeProfilerWithMainKey:" title="initTimeProfilerWithMainKey:"></a>
### initTimeProfilerWithMainKey:

`- (instancetype)initTimeProfilerWithMainKey:(NSString *)*mainKey*`

<a name="//api/name/postTimeProfileResultNotification" title="postTimeProfileResultNotification"></a>
### postTimeProfileResultNotification

`- (void)postTimeProfileResultNotification`

<a name="//api/name/printOutTimeProfileResult" title="printOutTimeProfileResult"></a>
### printOutTimeProfileResult

`- (void)printOutTimeProfileResult`

<a name="//api/name/recordEventTime:" title="recordEventTime:"></a>
### recordEventTime:

`- (void)recordEventTime:(NSString *)*eventName*`

<a name="//api/name/saveTimeProfileDataIntoFile:" title="saveTimeProfileDataIntoFile:"></a>
### saveTimeProfileDataIntoFile:

`- (void)saveTimeProfileDataIntoFile:(NSString *)*filePath*`

