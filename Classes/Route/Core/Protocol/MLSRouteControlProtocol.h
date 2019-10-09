//
//  MLSRouteControlProtocol.h
//  MLSModuleCenter
//
//  Created by MinLison on 2019/2/26.
//

#ifndef MLSRouteControlProtocol_h
#define MLSRouteControlProtocol_h
#import "MLSRoutes.h"
NS_ASSUME_NONNULL_BEGIN
@protocol MLSRouteControlProtocol <NSObject>

/**
 配置路由协议， 可自定义配置， 默认 bundleID
 */
@property (nonatomic, copy) NSString *routeScheme;

/**
 注册控制器
 
 @param routePattern 路由地址
 @param scheme urlScheme， 默认是 innerApp
 @param handlerClass 接收路由的 Class
 */
- (void)addRoute:(NSString *)routePattern scheme:(nullable NSString *)scheme handlerClass:(Class)handlerClass;
- (void)addRoute:(NSString *)routePattern handlerClass:(Class)handlerClass;

/**
 注册路由
 
 @param routePattern 路由地址
 @param scheme urlScheme， 默认是 innerApp
 @param handlerBlock 回调
 */
- (void)addRoute:(NSString *)routePattern scheme:(nullable NSString *)scheme handler:(nullable  MLSRouteHandlerParamsCallBackBlock)handlerBlock;
- (void)addRoute:(NSString *)routePattern handler:(nullable  MLSRouteHandlerParamsCallBackBlock)handlerBlock;

/**
 移除注册路由
 
 @param routePattern 路由正则
 */
- (void)removeRoute:(nullable NSString *)routePattern;
- (void)removeRoute:(nullable NSString *)routePattern forScheme:(nullable NSString *)scheme;

/**
 打开路由地址
 也可调用 [[UIApplication sharedApplication] openURL:url];
 @param routeURL 路由地址
 */
- (BOOL)routeURL:(NSURL *)routeURL;

/**
 打开路由地址
 
 @param routeURL 路由地址
 @param paramters 附加参数, 最终会回调给 handleObj
 */
- (BOOL)routeURL:(NSURL *)routeURL withParameters:(nullable  NSDictionary *)paramters;

/**
 打开路由地址
 
 @param routeURL 路由地址
 @param handlerBlock 回调函数
 @return 是否打开成功
 */
- (BOOL)routeURL:(NSURL *)routeURL handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock;

/**
 打开路由地址
 
 @param routeURL 路由地址
 @param parameters 回调函数
 @param handlerBlock 是否打开成功
 */
- (BOOL)routeURL:(NSURL *)routeURL withParameters:(nullable NSDictionary *)parameters handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock;

/// 获取路由结果对象
/// @param routeURL 路由地址
/// @param parameters 路由参数
- (id)routeObjForURL:(NSURL *)routeURL withParameters:(nullable NSDictionary *)parameters;

/**
 是否可以打开该地址
 
 @param routeUrl 路由地址
 @return  YES/NO
 */
- (BOOL)canHandleUrl:(NSURL *)routeUrl;

/**
 *  调用此方法来拼接 urlpattern 和 parameters
 *
 *
 *  @param scheme UrlScheme 默认 routeScheme
 *  @param pattern    url pattern 比如 @"beauty/:id"
 *  @param patternParamters 一个数组，数量要跟 pattern 里的变量一致
 *  @param queryParameters 一个字典，query取值
 *
 *  @return 返回生成的URL String
 */
- (NSURL *)generateURLWithScheme:(nullable NSString *)scheme pattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters queryParameters:(nullable NSDictionary *)queryParameters;
- (NSURL *)generateURLWithScheme:(nullable NSString *)scheme pattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters;
- (NSURL *)generateURLWithScheme:(nullable NSString *)scheme queryParameters:(nullable NSDictionary *)queryParameters;

- (NSURL *)generateURLWithPattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters queryParameters:(nullable NSDictionary *)queryParameters;
- (NSURL *)generateURLWithPattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters;
- (NSURL *)generateURLWithQueryParameters:(nullable NSDictionary *)queryParameters;
@end

#endif /* MLSRouteControlProtocol_h */
NS_ASSUME_NONNULL_END
