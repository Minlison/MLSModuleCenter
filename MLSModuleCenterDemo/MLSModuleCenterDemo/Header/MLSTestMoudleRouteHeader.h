// MLSTestMoudle Auto Create 
// Not Modify 
// Date: 2019-10-09 09:11:57 +0000 

#import <UIKit/UIKit.h>


#ifndef MLSTestMoudleRouteHeader_h
#define MLSTestMoudleRouteHeader_h



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

#endif // MLSTestMoudle_h
