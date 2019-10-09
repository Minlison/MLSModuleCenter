/**
 * Created by BeeHive.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */


#import "BHAnnotation.h"
#import "BHCommon.h"
#import "BeeHive.h"
#include <mach-o/getsect.h>
#include <mach-o/loader.h>
#include <mach-o/dyld.h>
#include <dlfcn.h>
#import <objc/runtime.h>
#import <objc/message.h>
#include <mach-o/ldsyms.h>
#import "BHRouter.h"
#import "MLSRoutes.h"
@interface BHRouter ()
+ (id)safePerformAction:(SEL)action
              forTarget:(NSObject *)target
             withParams:(NSDictionary *)params;
@end

NSArray<NSString *>* BHReadConfiguration(char *sectionName,const struct mach_header *mhp);
static void dyld_callback(const struct mach_header *mhp, intptr_t vmaddr_slide)
{
    NSArray *mods = BHReadConfiguration(BeehiveModSectName, mhp);
    for (NSString *modName in mods) {
        Class cls;
        if (modName) {
            cls = NSClassFromString(modName);
            
            if (cls) {
                [[BHModuleManager sharedManager] registerDynamicModule:cls];
            }
        }
    }
    
    //register services
    NSArray<NSString *> *services = BHReadConfiguration(BeehiveServiceSectName,mhp);
    for (NSString *map in services) {
        NSData *jsonData =  [map dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (!error) {
            if ([json isKindOfClass:[NSDictionary class]] && [json allKeys].count) {
                
                NSString *protocol = [json allKeys][0];
                NSString *clsName  = [json allValues][0];
                
                if (protocol && clsName) {
                    [[BHServiceManager sharedManager] registerService:NSProtocolFromString(protocol) implClass:NSClassFromString(clsName)];
                }
                
            }
        }
    }
    
    //register routes
    NSArray<NSString *> *routes = BHReadConfiguration(MLSRouteRegisterName,mhp);
    for (NSString *map in routes) {
        NSData *jsonData =  [map dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        id json = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (!error) {
            if ([json isKindOfClass:[NSDictionary class]]) {
                
                NSString *scheme = [json objectForKey:@"scheme"];
                if ([scheme isEqualToString:@MLSRouteDefaultScheme]) {
                    scheme = @"com.minlison.module";
                }
                NSString *target = [json objectForKey:@"target"];
                NSString *routePattern = [json objectForKey:@"routePattern"];
                if (!routePattern) {
                    routePattern = [NSString stringWithFormat:@"/%@",target];
                } else {
                    if ([[routePattern substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"/"]) {
                        routePattern = [NSString stringWithFormat:@"/%@%@",target, routePattern];
                    } else {
                        routePattern = [NSString stringWithFormat:@"/%@/%@",target, routePattern];
                    }
                }
                NSString *priority = [json objectForKey:@"priority"];
                Class targetClass = NSClassFromString(target);
                NSString *handler = [json objectForKey:@"handler"];
                SEL handlerSelector = nil;
                if (handler && ![handler isEqualToString:@MLSRouteRegisterName]) {
                    handlerSelector = NSSelectorFromString(handler);
                }
                
                if (!targetClass) {
                    continue;
                }
                MLSRouteHandlerParamsCallBackBlock handleBlock = nil;
                if (handlerSelector && [(id)targetClass respondsToSelector:handlerSelector]) {
                    handleBlock = ^id (NSDictionary<NSString *,id> *params){
                        NSDictionary *selParams = nil;
                        if ([handler containsString:@":"]) {
                            selParams = @{@"params" : params};
                        }
                        id returnObj = [BHRouter safePerformAction:handlerSelector
                                                         forTarget:(NSObject *)targetClass
                                                        withParams:selParams];
                        return returnObj;
                    };
                }
                routePattern = [routePattern stringByReplacingOccurrencesOfString:[NSString
                                                                                   stringWithFormat:@"%@/",target] withString:@""];
                if (handleBlock != nil) {
                    [[MLSRoutes routesForScheme:scheme] addRoute:routePattern identifier:target priority:MAX(0, priority.integerValue) handler:handleBlock];
                } else if (targetClass != nil) {
                    [[MLSRoutes routesForScheme:scheme] addRoute:routePattern identifier:target priority:MAX(0, priority.integerValue) handlerClass:targetClass];
                }
            }
        }
    }
}
__attribute__((constructor))
void initProphet() {
    _dyld_register_func_for_add_image(dyld_callback);
}

NSArray<NSString *>* BHReadConfiguration(char *sectionName,const struct mach_header *mhp)
{
    NSMutableArray *configs = [NSMutableArray array];
    unsigned long size = 0;
#ifndef __LP64__
    uintptr_t *memory = (uintptr_t*)getsectiondata(mhp, SEG_DATA, sectionName, &size);
#else
    const struct mach_header_64 *mhp64 = (const struct mach_header_64 *)mhp;
    uintptr_t *memory = (uintptr_t*)getsectiondata(mhp64, SEG_DATA, sectionName, &size);
#endif
    
    unsigned long counter = size/sizeof(void*);
    for(int idx = 0; idx < counter; ++idx){
        char *string = (char*)memory[idx];
        NSString *str = [NSString stringWithUTF8String:string];
        if(!str)continue;
        
        BHLog(@"config = %@", str);
        if(str) [configs addObject:str];
    }
    
    return configs;
    
    
}

@implementation BHAnnotation

@end


