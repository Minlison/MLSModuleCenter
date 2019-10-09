/// Automatically created by script in Build Phases

#import <UIKit/UIKit.h>

#ifndef MLSModuleCenter_h
#define MLSModuleCenter_h

#if __has_include("MLSModuleCenter.h")
    #if __has_include("MLSAppDelegate.h")
        #import "BHAnnotation.h"
        #import "BHAppDelegate.h"
        #import "BHCommon.h"
        #import "BHConfig.h"
        #import "BHContext.h"
        #import "BHDefines.h"
        #import "BHModuleManager.h"
        #import "BHModuleProtocol.h"
        #import "BHRouter.h"
        #import "BHServiceManager.h"
        #import "BHServiceProtocol.h"
        #import "BHTimeProfiler.h"
        #import "BHWatchDog.h"
        #import "BeeHive.h"
        #import "MLSAppDelegate.h"
        #import "MLSBaseModule.h"
        #import "MLSServiceProtocol.h"
    #endif

    #if __has_include("MLSRoutes.h")
        #import "MLSParsingUtilities.h"
        #import "MLSRouteDefinition.h"
        #import "MLSRouteRequest.h"
        #import "MLSRouteResponse.h"
        #import "MLSRouteControlProtocol.h"
        #import "MLSRoutes.h"
        #import "NSDictionary+MLSRouter.h"
        #import "NSObject+MLSRouter.h"
        #import "UIViewController+MLSRouter.h"
    #endif

    #if __has_include("MLSGenerateRouteHeaderTool.h")
        #import "MLSGenerateRouteHeaderTool.h"
    #endif

#else

    #if __has_include("MLSAppDelegate.h")
        #import <MLSModuleCenter/BHAnnotation.h>
        #import <MLSModuleCenter/BHAppDelegate.h>
        #import <MLSModuleCenter/BHCommon.h>
        #import <MLSModuleCenter/BHConfig.h>
        #import <MLSModuleCenter/BHContext.h>
        #import <MLSModuleCenter/BHDefines.h>
        #import <MLSModuleCenter/BHModuleManager.h>
        #import <MLSModuleCenter/BHModuleProtocol.h>
        #import <MLSModuleCenter/BHRouter.h>
        #import <MLSModuleCenter/BHServiceManager.h>
        #import <MLSModuleCenter/BHServiceProtocol.h>
        #import <MLSModuleCenter/BHTimeProfiler.h>
        #import <MLSModuleCenter/BHWatchDog.h>
        #import <MLSModuleCenter/BeeHive.h>
        #import <MLSModuleCenter/MLSAppDelegate.h>
        #import <MLSModuleCenter/MLSBaseModule.h>
        #import <MLSModuleCenter/MLSServiceProtocol.h>
    #endif

    #if __has_include("MLSRoutes.h")
        #import <MLSModuleCenter/MLSParsingUtilities.h>
        #import <MLSModuleCenter/MLSRouteDefinition.h>
        #import <MLSModuleCenter/MLSRouteRequest.h>
        #import <MLSModuleCenter/MLSRouteResponse.h>
        #import <MLSModuleCenter/MLSRouteControlProtocol.h>
        #import <MLSModuleCenter/MLSRoutes.h>
        #import <MLSModuleCenter/NSDictionary+MLSRouter.h>
        #import <MLSModuleCenter/NSObject+MLSRouter.h>
        #import <MLSModuleCenter/UIViewController+MLSRouter.h>
    #endif

    #if __has_include("MLSGenerateRouteHeaderTool.h")
        #import "MLSGenerateRouteHeaderTool.h"
    #endif
#endif


#endif /* MLSModuleCenter_h */
