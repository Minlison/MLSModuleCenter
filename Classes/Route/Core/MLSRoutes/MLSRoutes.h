//
//  MLSRoutes.h
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@class MLSRouteDefinition;
@class MLSRoutes;
@protocol MLSRouteDefinitionTargetController;

/// The matching route pattern, passed in the handler parameters.
extern NSString *const MLSRoutePatternKey;

/// The original URL that was routed, passed in the handler parameters.
extern NSString *const MLSRouteURLKey;

/// The matching route scheme, passed in the handler parameters.
extern NSString *const MLSRouteSchemeKey;

/// The wildcard components (if present) of the matching route, passed in the handler parameters.
extern NSString *const MLSRouteWildcardComponentsKey;

/**
 回调Block
 
 @param parameters 参数
 @param targetObj 控制器或者返回值
 */
typedef BOOL (^MLSRouteHandleTargetCallBackBlock)( NSMutableDictionary<NSString *, id>  * _Nullable parameters, id targetObj);
typedef id (^MLSRouteHandlerParamsCallBackBlock )( NSMutableDictionary <NSString *, id>  * _Nullable parameters);
typedef void (^MLSRouteUnMatchedURLHandlerBlock)(MLSRoutes *routes, NSURL *__nullable URL, NSDictionary<NSString *, id> *__nullable parameters);


/**
 The MLSRoutes class is the main entry-point into the MLSRoutes framework. Used for accessing schemes, managing routes, and routing URLs.
 */

@interface MLSRoutes : NSObject

/// Controls whether or not this router will try to match a URL with global routes if it can't be matched in the current namespace. Default is NO.
@property (nonatomic, assign) BOOL shouldFallbackToGlobalRoutes;

/// Called any time routeURL returns NO. Respects shouldFallbackToGlobalRoutes.
@property (nonatomic, copy, nullable) MLSRouteUnMatchedURLHandlerBlock unmatchedURLHandler;

/**
 全局的scheme
 */
@property (nonatomic, copy, class) NSString *globalScheme;

///-------------------------------
/// @name Routing Schemes
///-------------------------------


/// Returns the global routing scheme
+ (instancetype)globalRoutes;

/// Returns a routing namespace for the given scheme
+ (instancetype)routesForScheme:(NSString *)scheme;

/// Unregister and delete an entire scheme namespace
+ (void)unregisterRouteScheme:(NSString *)scheme;

/// Unregister all routes
+ (void)unregisterAllRouteSchemes;


///-------------------------------
/// @name Managing Routes
///-------------------------------


/// Add a route by directly inserted the route definition. This may be a subclass of MLSRouteDefinition to provide customized routing logic.
- (void)addRoute:(MLSRouteDefinition *)routeDefinition;

/// Registers a routePattern with default priority (0) in the receiving scheme namespace.
- (void)addRoute:(NSString *)routePattern handler:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock;

/// Registers a routePattern in the global scheme namespace with a handlerBlock to call when the route pattern is matched by a URL.
/// The block returns a BOOL representing if the handlerBlock actually handled the route or not. If
/// a block returns NO, MLSRoutes will continue trying to find a matching route.
- (void)addRoute:(NSString *)routePattern priority:(NSUInteger)priority handler:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock;
- (void)addRoute:(NSString *)routePattern identifier:(nullable NSString *)identifier priority:(NSUInteger)priority handler:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock;
/// Registers multiple routePatterns for one handler with default priority (0) in the receiving scheme namespace.
- (void)addRoutes:(NSArray<NSString *> *)routePatterns handler:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock;


/// Registers a routePattern with default priority (0) in the receiving scheme namespace.
- (void)addRoute:(NSString *)routePattern handlerClass:(nullable Class)handlerClass;
- (void)addRoute:(NSString *)routePattern identifier:(nullable NSString *)identifier handlerClass:(nullable Class)handlerClass;

/// Registers a routePattern in the global scheme namespace with a handlerBlock to call when the route pattern is matched by a URL.
/// The block returns a BOOL representing if the handlerBlock actually handled the route or not. If
/// a block returns NO, MLSRoutes will continue trying to find a matching route.
- (void)addRoute:(NSString *)routePattern priority:(NSUInteger)priority handlerClass:(nullable Class)handlerClass;
- (void)addRoute:(NSString *)routePattern identifier:(nullable NSString *)identifier priority:(NSUInteger)priority handlerClass:(Class)handlerClass;
/// Registers multiple routePatterns for one handler with default priority (0) in the receiving scheme namespace.
- (void)addRoutes:(NSArray<NSString *> *)routePatterns handlerClass:(nullable Class)handlerClass;

/// Removes a routePattern from the receiving scheme namespace.
- (void)removeRoute:(NSString *)routePattern;

/**
 移除指定scheme的route
 如果 scheme 为空，则移除global的routepattern
 如果 routePattern 为空，则移除所有scheme对应的routes

 @param scheme scheme
 @param routePattern route
 */
+ (void)removeScheme:(nullable NSString *)scheme route:(nullable NSString *)routePattern;

/// Removes all routes from the receiving scheme namespace.
- (void)removeAllRoutes;

/// Registers a routePattern with default priority (0) using dictionary-style subscripting.
- (void)setObject:(nullable id)obj forKeyedSubscript:(NSString *)routePatten;

/// Return all registered routes in the receiving scheme namespace.
/// @see allRoutes
- (NSArray <MLSRouteDefinition *> *)routes;

/// All registered routes, keyed by scheme
/// @see routes
+ (NSDictionary <NSString *, NSArray <MLSRouteDefinition *> *> *)allRoutes;


///-------------------------------
/// @name Routing URLs
///-------------------------------


/// Returns YES if the provided URL will successfully match against any registered route, NO if not.
+ (BOOL)canRouteURL:(nullable NSURL *)URL;

/// Returns YES if the provided URL will successfully match against any registered route for the current scheme, NO if not.
- (BOOL)canRouteURL:(nullable NSURL *)URL;

/// Routes a URL, calling handler blocks for patterns that match the URL until one returns YES.
/// If no matching route is found, the unmatchedURLHandler will be called (if set).
+ (BOOL)routeURL:(nullable NSURL *)URL handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock;

/// Routes a URL within a particular scheme, calling handler blocks for patterns that match the URL until one returns YES.
/// If no matching route is found, the unmatchedURLHandler will be called (if set).
- (BOOL)routeURL:(nullable NSURL *)URL handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock;

/// Routes a URL in any routes scheme, calling handler blocks (for patterns that match URL) until one returns YES.
/// Additional parameters get passed through to the matched route block.
+ (BOOL)routeURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock;
/// 获取 route 的对象
+ (id)objectForURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters;

/// Routes a URL in a specific scheme, calling handler blocks (for patterns that match URL) until one returns YES.
/// Additional parameters get passed through to the matched route block.
- (BOOL)routeURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock;


@end


// Global settings to use for parsing and routing.

@interface MLSRoutes (GlobalOptions)

///----------------------------------
/// @name Configuring Global Options
///----------------------------------

/// Configures verbose logging. Defaults to NO.
+ (void)setVerboseLoggingEnabled:(BOOL)loggingEnabled;

/// Returns current verbose logging enabled state. Defaults to NO.
+ (BOOL)isVerboseLoggingEnabled;

/// Configures if '+' should be replaced with spaces in parsed values. Defaults to YES.
+ (void)setShouldDecodePlusSymbols:(BOOL)shouldDecode;

/// Returns if '+' should be replaced with spaces in parsed values. Defaults to YES.
+ (BOOL)shouldDecodePlusSymbols;

/// Configures if URL host is always considered to be a path component. Defaults to NO.
+ (void)setAlwaysTreatsHostAsPathComponent:(BOOL)treatsHostAsPathComponent;

/// Returns if URL host is always considered to be a path component. Defaults to NO.
+ (BOOL)alwaysTreatsHostAsPathComponent;

@end


@interface MLSRoutes (Generate)
/**
 *  调用此方法来拼接 urlpattern 和 parameters
 *
 *  #define MGJ_ROUTE_BEAUTY @"beauty/:id"
 *  [MLSRoutes generateURLWithPattern:MGJ_ROUTE_BEAUTY, @[@13]];
 *
 *
 *  @param pattern    url pattern 比如 @"beauty/:id"
 *  @param parameters 一个数组，数量要跟 pattern 里的变量一致
 *
 *  @return 返回生成的URL String
 */
+ (NSString *)generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters;
@end
NS_ASSUME_NONNULL_END
