# MLSGenerateRouteHeaderTool Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** MLSGenerateRouteHeaderTool.h  

## Tasks

### 

[+&nbsp;generateRoutesHeaderToDir:](#//api/name/generateRoutesHeaderToDir:)  

[+&nbsp;generateRoutesHeaderToDir:moudleName:](#//api/name/generateRoutesHeaderToDir:moudleName:)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/generateRoutesHeaderToDir:" title="generateRoutesHeaderToDir:"></a>
### generateRoutesHeaderToDir:

生成路由参数列表文件
默认某块名为 bundleID 的最后一部分大写

`+ (void)generateRoutesHeaderToDir:(NSString *)*dir*`

#### Parameters

*dir*  
&nbsp;&nbsp;&nbsp;输出路径  

#### Declared In
* `MLSGenerateRouteHeaderTool.h`

<a name="//api/name/generateRoutesHeaderToDir:moudleName:" title="generateRoutesHeaderToDir:moudleName:"></a>
### generateRoutesHeaderToDir:moudleName:

生成路由参数头文件

`+ (void)generateRoutesHeaderToDir:(NSString *)*dir* moudleName:(NSString *)*moudleName*`

#### Parameters

*dir*  
&nbsp;&nbsp;&nbsp;路径  

*moudleName*  
&nbsp;&nbsp;&nbsp;模块名  

#### Declared In
* `MLSGenerateRouteHeaderTool.h`

