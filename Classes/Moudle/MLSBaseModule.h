//
//  MLSModule.h
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHModuleProtocol.h"

/**
 * 基类 Module
 * 每创建一个模块时, 需要继承该类, 并在Module 头文件中, 引入该模块的所有暴露的头文件
 * 可以使用 MOUDLE_EXPORT(NO) 是否异步加载 Module (该方法是在 +load 方法内调用, 需要写到 @implementation 和 @end 之间)
 * 也可以使用 @BeeHiveMod(BaseModule) 来注册 Moudlle (该方法是在应用启动前, 加载符号文件时候调用)
 */
#define MLS_MOUDLE_REGISTER(moudle_imp) BeeHiveMod(moudle_imp)

#define MLS_MOUDLE_EXPORT(async) BH_EXPORT_MODULE(async)
@interface MLSModule : NSObject <BHModuleProtocol>

@end

@interface MLSBaseModule : MLSModule

@end
