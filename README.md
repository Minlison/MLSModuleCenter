# MLSModuleCenter 模块化中心
---

![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)

## MLSModuleCenter 是什么

MLSModuleCenter 是 App 模块化一体式解决方案中心，基于阿里巴巴 [BeeHive](https://github.com/alibaba/BeeHive) 模块加载， [JLRoutes](https://github.com/joeldev/JLRoutes) 路由跳转达到模块解耦。

## MLSModuleCenter 提供了哪些功能
* 基于 BeeHive 二次修改，集成 JLRoutes 路由系统
* 使用 MLSGenerateRouteHeaderTool 自动生成 NSURL 分类路由头文件。

## 哪些项目适合使用 MLSModuleCenter
* MLSModuleCenter 适用于大型项目，使用 Cocoapods 进行模块集成更为优雅
* 小型项目不建议使用，会造成过多资源浪费。

## MLSModuleCenter 基本思想
* 封装业务模块，业务系统依赖基础Kit，独立业务系统，各业务系统之间的调用只暴露URL参数，提高业务系统的复用性。
* 独立研发开发，单个业务模块可独立测试。

## MLSModuleCenter 安装
你可以在 Podfile 最上方增加source源，

	source 'https://github.com/Minlison/Specs.git'

加入下面一行代码来使用 MLSModuleCenter

    pod 'MLSModuleCenter'

或者直接使用源码依赖

## 安装要求

| MLSModuleCenter 版本 |  最低 iOS Target | 注意 |
|:----------------:|:----------------:|:-----|
| 1.x  | iOS 8 | 要求 Xcode 8 以上  |


## 相关的使用教程和 Demo
可参考项目中的Demo项目

## 作者
MLSNetwork 属于个人研发

## 感谢

MLSModuleCenter 基于 [BeeHive](https://github.com/alibaba/BeeHive) [JLRoutes](https://github.com/joeldev/JLRoutes) 进行开发，感谢他们对开源社区做出的贡献。

## 协议

MLSModuleCenter 被许可在 MIT 协议下使用。查阅 LICENSE 文件来获得更多信息。