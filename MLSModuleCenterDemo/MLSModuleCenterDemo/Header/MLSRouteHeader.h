// MLS Auto Create 
// Not Modify 
// Date: 2019-12-06 05:35:34 +0000 

#import <UIKit/UIKit.h>


#ifndef MLSRouteHeader_h
#define MLSRouteHeader_h



@interface NSURL (MLSTestDefaultViewController_Routes)

// 目标控制器 test
// urlPatten /test/default
// 快速创建url
+ (NSURL *)URLForRouteTestDefault;

@end

@interface NSURL (MLSTestPathParamsViewController_Routes)

// 目标控制器 testPath
// urlPatten /testPath/default/:type
// 快速创建url
+ (NSURL *)URLForRouteTestPathDefaultType:(NSString *)type;

@end

@interface NSURL (MLSTestSchemeViewController_Routes)

// 目标控制器 testPath
// urlPatten /testPath/scheme
// 快速创建url
+ (NSURL *)URLForRouteTestPathScheme;

@end

#endif // MLS_h
