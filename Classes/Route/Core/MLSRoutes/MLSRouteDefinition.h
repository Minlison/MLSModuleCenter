//
//  MLSRouteDefinition.h
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MLSRoutes.h"
#import "MLSRouteRequest.h"
#import "MLSRouteResponse.h"

@class MLSRouteDefinition;
NS_ASSUME_NONNULL_BEGIN

@protocol MLSRouteDefinitionTargetController <NSObject>

/**
 创建控制器

 @param parameters 参数
 @return 控制器(如果为空, 则不能 handleUrl)
 */
+ (nullable UIViewController <MLSRouteDefinitionTargetController> *)targetControllerWithParams:(nullable NSDictionary *)parameters;

@end

/**
 MLSRouteDefinition is a model object representing a registered route, including the URL scheme, route pattern, and priority.
 
 This class can be subclassed to customize route parsing behavior by overriding -routeResponseForRequest:decodePlusSymbols:.
 -callHandlerBlockWithParameters can also be overriden to customize the parameters passed to the handlerBlock.
 */

@interface MLSRouteDefinition : NSObject

/// The URL scheme for which this route applies, or MLSRoutesGlobalRoutesScheme if global.
@property (nonatomic, copy, readonly) NSString *scheme;

/// 标识符
@property(nonatomic, copy) NSString *identifier;

/// The route pattern.
@property (nonatomic, copy, readonly) NSString *pattern;

/// The priority of this route pattern.
@property (nonatomic, assign, readonly) NSUInteger priority;

/// The handler block to invoke when a match is found.
@property (nonatomic, copy, readonly) MLSRouteHandlerParamsCallBackBlock handlerBlock;

/// The handler block to invoke when a match is found.
@property (nonatomic, copy, nullable) BOOL (^handlerVCBlock)(UIViewController <MLSRouteDefinitionTargetController> *targetVC);
/**
 目标控制器类
 遵守 MLSRouteDefinitionTargetController 协议
 */
@property (strong, nonatomic) Class targetControllerClass;
@property (strong, nonatomic, nullable) UIViewController <MLSRouteDefinitionTargetController>  *targetViewController;

///---------------------------------
/// @name Creating Route Definitions
///---------------------------------


/**
 Creates a new route definition. The created definition can be directly added to an instance of MLSRoutes.
 
 This is the designated initializer.
 
 @param scheme The URL scheme this route applies for, or MLSRoutesGlobalRoutesScheme if global.
 @param pattern The full route pattern ('/foo/:bar')
 @param priority The route priority, or 0 if default.
 @param handlerBlock The handler block to call when a successful match is found.
 
 @returns The newly initialized route definition.
 */
- (instancetype)initWithScheme:(NSString *)scheme pattern:(NSString *)pattern priority:(NSUInteger)priority handlerBlock:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock;
/// 控制器 handler
- (instancetype)initWithScheme:(NSString *)scheme pattern:(NSString *)pattern priority:(NSUInteger)priority handlerClass:(Class)handlerClass ;

/// Unavailable, use initWithScheme:pattern:priority:handlerBlock: instead.
- (instancetype)init NS_UNAVAILABLE;

/// Unavailable, use initWithScheme:pattern:priority:handlerBlock: instead.
+ (instancetype)new NS_UNAVAILABLE;


///-------------------------------
/// @name Matching Route Requests
///-------------------------------


/**
 Creates and returns a MLSRouteResponse for the provided MLSRouteRequest. The response specifies if there was a match or not.
 
 @param request The MLSRouteRequest to create a response for.
 @param decodePlusSymbols The global plus symbol decoding option value.
 
 @returns An MLSRouteResponse instance representing the result of attempting to match request to thie route definition.
 */
- (MLSRouteResponse *)routeResponseForRequest:(MLSRouteRequest *)request decodePlusSymbols:(BOOL)decodePlusSymbols;


/**
 Invoke handlerBlock with the given parameters. This may be overriden by subclasses.
 
 @param parameters The parameters to pass to handlerBlock.
 
 @returns The value returned by calling handlerBlock (YES if it is considered handled and NO if not).
 */
- (id)callHandlerBlockWithParameters:(NSDictionary *)parameters;
- (BOOL)canCallHandlerBlockWithParameters:(NSMutableDictionary *)parameters;
- (BOOL)callControllerHandlerBlockWithParameters:(NSDictionary *)parameters;
@end


NS_ASSUME_NONNULL_END
