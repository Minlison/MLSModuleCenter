//
//  NSObject+MLSRouter.m
//  MLSModuleCenter
//
//  Created by MinLison on 2019/2/26.
//

#import "NSObject+MLSRouter.h"
#import <objc/runtime.h>
#import "NSDictionary+MLSRouter.h"
@implementation NSObject (MLSRouter)
- (void)setRouteScheme:(NSString *)routeScheme {
    objc_setAssociatedObject(self, @selector(routeScheme), routeScheme, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)routeScheme {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)addRoute:(NSString *)routePattern scheme:(NSString *)scheme handlerClass:(Class)handlerClass {
    [[MLSRoutes routesForScheme:scheme] addRoute:routePattern handlerClass:handlerClass];
}
- (void)addRoute:(NSString *)routePattern handlerClass:(Class)handlerClass {
    [[MLSRoutes globalRoutes] addRoute:routePattern handlerClass:handlerClass];
}

- (void)addRoute:(NSString *)routePattern scheme:(NSString *)scheme handler:(__nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock {
    [[MLSRoutes routesForScheme:scheme] addRoute:routePattern handler:handlerBlock];
}
- (void)addRoute:(NSString *)routePattern handler:(__nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock {
    [[MLSRoutes globalRoutes] addRoute:routePattern handler:handlerBlock];
}

- (void)removeRoute:(NSString *)routePattern {
    if (!routePattern.length) {
        return;
    }
    [MLSRoutes removeScheme:[NSURL URLWithString:routePattern].scheme route:routePattern];
}

- (void)removeRoute:(NSString *)routePattern forScheme:(NSString *)scheme {
    [MLSRoutes removeScheme:scheme route:routePattern];
}

- (BOOL)routeURL:(NSURL *)routeURL {
    return [self routeURL:routeURL handler:nil];
}

- (BOOL)routeURL:(NSURL *)routeURL withParameters:( NSDictionary * _Nullable )paramters {
    return [self routeURL:routeURL withParameters:paramters handler:nil];
}

- (BOOL)routeURL:(NSURL *)routeURL handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock {
    return [MLSRoutes routeURL:routeURL handler:handlerBlock];
}

- (BOOL)routeURL:(NSURL *)routeURL withParameters:(NSDictionary *)paramters handler:(__nullable MLSRouteHandleTargetCallBackBlock)handlerBlock {
    return [MLSRoutes routeURL:routeURL withParameters:paramters handler:handlerBlock];
}

- (id)routeObjForURL:(NSURL *)routeURL withParameters:(NSDictionary *)parameters {
    return [MLSRoutes objectForURL:routeURL withParameters:parameters];
}

- (BOOL)canHandleUrl:(NSURL *)routeUrl {
    return [MLSRoutes canRouteURL:routeUrl];
}



- (NSURL *)generateURLWithScheme:(nullable NSString *)scheme pattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters queryParameters:(nullable NSDictionary *)queryParameters {
    
    NSMutableString *urlString = [[NSMutableString alloc] init];
    if (!scheme.length) {
        scheme = MLSRoutes.globalScheme.copy;
        self.routeScheme = MLSRoutes.globalScheme.copy;
    }
    [urlString appendFormat:@"%@://", scheme];
    if (pattern.length > 0 && patternParamters.count > 0) {
        if (![[pattern substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"/"]) {
            pattern = [NSString stringWithFormat:@"/%@",pattern];
        }
        NSString *urlStr = [MLSRoutes generateURLWithPattern:pattern parameters:patternParamters];
        [urlString appendFormat:@"%@",[urlStr stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""]];
    }
    if (queryParameters != nil) {
        [urlString appendFormat:@"?%@", queryParameters.routerParams];
    }
    return [NSURL URLWithString:urlString];
}
- (NSURL *)generateURLWithScheme:(nullable NSString *)scheme pattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters {
    return [self generateURLWithScheme:scheme pattern:pattern patternParamters:patternParamters queryParameters:nil];
}
- (NSURL *)generateURLWithScheme:(nullable NSString *)scheme queryParameters:(nullable NSDictionary *)queryParameters {
    return [self generateURLWithScheme:scheme pattern:nil patternParamters:nil queryParameters:queryParameters];
}

- (NSURL *)generateURLWithPattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters queryParameters:(nullable NSDictionary *)queryParameters {
    return [self generateURLWithScheme:nil pattern:pattern patternParamters:patternParamters queryParameters:queryParameters];
}
- (NSURL *)generateURLWithPattern:(nullable NSString *)pattern patternParamters:(nullable NSArray *)patternParamters {
    return [self generateURLWithScheme:nil pattern:pattern patternParamters:patternParamters queryParameters:nil];
}
- (NSURL *)generateURLWithQueryParameters:(nullable NSDictionary *)queryParameters {
    return [self generateURLWithScheme:nil pattern:nil patternParamters:nil queryParameters:queryParameters];
}
@end

