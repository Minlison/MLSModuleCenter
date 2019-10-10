# MLSModule Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Conforms to** <a href="../Protocols/BHModuleProtocol.html">BHModuleProtocol</a>  
&nbsp;&nbsp;**Declared in** MLSBaseModule.h  

## Overview

基类 Module
每创建一个模块时, 需要继承该类, 并在Module 头文件中, 引入该模块的所有暴露的头文件
可以使用 MOUDLE_EXPORT(NO) 是否异步加载 Module (该方法是在 +load 方法内调用, 需要写到 @implementation 和 @end 之间)
也可以使用 @BeeHiveMod(BaseModule) 来注册 Moudlle (该方法是在应用启动前, 加载符号文件时候调用)

