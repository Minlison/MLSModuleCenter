/**
 * Created by BeeHive.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */


#import <Foundation/Foundation.h>
#import "BeeHive.h"

#ifndef BeehiveModSectName

#define BeehiveModSectName "BeehiveMods"

#endif

#ifndef BeehiveServiceSectName

#define BeehiveServiceSectName "BeehiveServices"

#endif

#ifndef MLSRouteRegisterName

#define MLSRouteRegisterName "MLSRouteRegistes"

#endif

#ifndef MLSRouteDefaultScheme

#define MLSRouteDefaultScheme "MLSRouteDefaultScheme"

#endif

#ifndef MLSRouteRegisterNoHandler

#define MLSRouteRegisterNoHandler "MLSRouteRegisterNoHandler"

#endif

#define BeeHiveDATA(sectname) __attribute((used, section("__DATA,"#sectname" ")))

#define BeeHiveMod(name) \
class BeeHive; char * k##name##_mod BeeHiveDATA(BeehiveMods) = ""#name"";

#define BeeHiveService(servicename,impl) \
class BeeHive; char * k##servicename##_service BeeHiveDATA(BeehiveServices) = "{ \""#servicename"\" : \""#impl"\"}";

// 使用宏定义注解形式注册路由

// identifier 唯一标识符号，在同一个类里面，不可重复，可以使用数字，字母，下划线
// target 类对象
// scheme 路由scheme协议, 只允许大小写字母和下划线
// priority 优先级，默认为 0 ，必须是大于等于0
// routePattern 路由 path
// handler 必须是类方法，target 必须实现, 接收一个参数，是路由所传入参数
// 举例方法 + (void)routeParams:(NSMutableDictionary *)params; params 可增加参数，用户 route 回调
// 如果没有指定 handler 方法，会调用 MLSRRouteDefinitionTargetController 协议方法，获取 targetController 如果不是UIViewController 对象，不会回传
#define MLSRouteRegister(identifier, target, scheme, priority, routePattern, handler) \
class BeeHive; char * k##identifier##_##target##_##scheme##_##priority##_route BeeHiveDATA(MLSRouteRegistes) = "{ \"target\" : \""#target"\", \"scheme\" : \""#scheme"\", \"priority\" : \""#priority"\",  \"routePattern\" : "#routePattern", \"handler\" : "#handler"}";

#define MLSRouteRegisterPriorityHandlerDefaultScheme(identifier, target, priority, routePattern, handler) MLSRouteRegister(identifier, target, MLSRouteDefaultScheme, priority, routePattern, handler)
#define MLSRouteRegisterHandlerDefaultScheme(identifier, target, routePattern, handler) MLSRouteRegisterPriorityHandlerDefaultScheme(identifier, target, 0, routePattern, handler)
#define MLSRouteRegisterDefaultScheme(identifier, target, routePattern) MLSRouteRegisterHandlerDefaultScheme(identifier, target, routePattern, "MLSRouteRegisterNoHandler")
@interface BHAnnotation : NSObject

@end
