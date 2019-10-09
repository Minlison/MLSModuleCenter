//
//  MLSRoutes.m
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import "MLSRoutes.h"
#import "MLSRouteDefinition.h"
#import "MLSParsingUtilities.h"
#import <objc/runtime.h>


NSString *const MLSRoutePatternKey = @"MLSRoutePattern";
NSString *const MLSRouteURLKey = @"MLSRouteURL";
NSString *const MLSRouteSchemeKey = @"MLSRouteScheme";
NSString *const MLSRouteWildcardComponentsKey = @"MLSRouteWildcardComponents";
static NSString *const specialCharacters = @"/?&.";

static NSMutableDictionary *routeControllersMap = nil;

// global options
static BOOL verboseLoggingEnabled = NO;
static BOOL shouldDecodePlusSymbols = YES;
static BOOL alwaysTreatsHostAsPathComponent = NO;
/// The global routes namespace.
/// @see MLSRoutes +globalRoutes
static NSString *MLSRoutesGlobalRoutesScheme;

@interface MLSRoutes ()

@property (nonatomic, strong) NSMutableArray *mutableRoutes;
@property (nonatomic, strong) NSString *scheme;

@end


#pragma mark -

@implementation MLSRoutes
+ (void)load {
    [self configGlobalScheme];
}
- (instancetype)init {
    if ((self = [super init])) {
        self.mutableRoutes = [NSMutableArray array];
    }
    return self;
}

- (NSString *)description {
    return [self.mutableRoutes description];
}

+ (NSDictionary <NSString *, NSArray <MLSRouteDefinition *> *> *)allRoutes; {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    for (NSString *namespace in [routeControllersMap copy]) {
        MLSRoutes *routesController = routeControllersMap[namespace];
        dictionary[namespace] = [routesController.mutableRoutes copy];
    }
    
    return [dictionary copy];
}


#pragma mark - Routing Schemes

+ (instancetype)globalRoutes {
    return [self routesForScheme:MLSRoutesGlobalRoutesScheme];
}

+ (NSString *)globalScheme {
    [self configGlobalScheme];
    return MLSRoutesGlobalRoutesScheme;
}

+ (void)setGlobalScheme:(NSString *)globalScheme {
    MLSRoutesGlobalRoutesScheme = globalScheme.copy;
}

+ (instancetype)routesForScheme:(NSString *)scheme {
    MLSRoutes *routesController = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        routeControllersMap = [[NSMutableDictionary alloc] init];
        [self configGlobalScheme];
    });
    
    if (!routeControllersMap[scheme]) {
        routesController = [[self alloc] init];
        routesController.scheme = scheme;
        routeControllersMap[scheme] = routesController;
    }
    
    routesController = routeControllersMap[scheme];
    
    return routesController;
}

+ (void)configGlobalScheme {
    if (MLSRoutesGlobalRoutesScheme.length > 0) {
        return;
    }
    if (!MLSRoutesGlobalRoutesScheme.length) {
        NSDictionary *infoDictionary = [[NSBundle bundleForClass:self] infoDictionary];
        MLSRoutesGlobalRoutesScheme = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    }
    if (!MLSRoutesGlobalRoutesScheme.length) {
        MLSRoutesGlobalRoutesScheme = @"com.minlison.route";
    }
}

+ (void)unregisterRouteScheme:(NSString *)scheme {
    [routeControllersMap removeObjectForKey:scheme];
}

+ (void)unregisterAllRouteSchemes {
    [routeControllersMap removeAllObjects];
}


#pragma mark - Registering Routes

- (void)addRoute:(MLSRouteDefinition *)routeDefinition {
    [self _registerRoute:routeDefinition];
}

- (void)addRoute:(NSString *)routePattern handler:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock {
    [self addRoute:routePattern priority:0 handler:handlerBlock];
}

- (void)addRoutes:(NSArray<NSString *> *)routePatterns handler:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock {
    for (NSString *routePattern in routePatterns) {
        [self addRoute:routePattern handler:handlerBlock];
    }
}
- (void)addRoute:(NSString *)routePattern identifier:(NSString *)identifier priority:(NSUInteger)priority handler:(MLSRouteHandlerParamsCallBackBlock)handlerBlock {
    NSArray <NSString *> *optionalRoutePatterns = [MLSParsingUtilities expandOptionalRoutePatternsForPattern:routePattern];
    MLSRouteDefinition *route = [[MLSRouteDefinition alloc] initWithScheme:self.scheme pattern:routePattern priority:priority handlerBlock:handlerBlock];
    route.identifier = identifier;
    
    if (optionalRoutePatterns.count > 0) {
        // there are optional params, parse and add them
        for (NSString *pattern in optionalRoutePatterns) {
            [self _verboseLog:@"Automatically created optional route: %@", route];
            MLSRouteDefinition *optionalRoute = [[MLSRouteDefinition alloc] initWithScheme:self.scheme pattern:pattern priority:priority handlerBlock:handlerBlock];
            [self _registerRoute:optionalRoute];
        }
        return;
    }
    
    [self _registerRoute:route];
}
- (void)addRoute:(NSString *)routePattern priority:(NSUInteger)priority handler:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock {
    [self addRoute:routePattern identifier:nil priority:priority handler:handlerBlock];
}

- (void)addRoute:(NSString *)routePattern identifier:(nullable NSString *)identifier handlerClass:(nullable Class)handlerClass {
    [self addRoute:routePattern identifier:identifier priority:0 handlerClass:handlerClass];
}

- (void)addRoute:(NSString *)routePattern handlerClass:(Class)handlerClass {
    [self addRoute:routePattern identifier:nil priority:0 handlerClass:handlerClass];
}
- (void)addRoute:(NSString *)routePattern identifier:(NSString *)identifier priority:(NSUInteger)priority handlerClass:(Class)handlerClass {
    NSArray <NSString *> *optionalRoutePatterns = [MLSParsingUtilities expandOptionalRoutePatternsForPattern:routePattern];
    MLSRouteDefinition *route = [[MLSRouteDefinition alloc] initWithScheme:self.scheme pattern:routePattern priority:priority handlerClass:handlerClass];
    route.identifier = identifier;
    
    if (optionalRoutePatterns.count > 0) {
        // there are optional params, parse and add them
        for (NSString *pattern in optionalRoutePatterns) {
            [self _verboseLog:@"Automatically created optional route: %@", route];
            MLSRouteDefinition *optionalRoute = [[MLSRouteDefinition alloc] initWithScheme:self.scheme pattern:pattern priority:priority handlerClass:handlerClass];
            optionalRoute.handlerVCBlock = ^BOOL(UIViewController<MLSRouteDefinitionTargetController> * _Nonnull targetVC) {
                return targetVC != nil;
            };
            [self _registerRoute:optionalRoute];
        }
        return;
    }
    
    [self _registerRoute:route];
}

- (void)addRoute:(NSString *)routePattern priority:(NSUInteger)priority handlerClass:(Class)handlerClass {
    [self addRoute:routePattern identifier:nil priority:priority handlerClass:handlerClass];
}

- (void)addRoutes:(NSArray<NSString *> *)routePatterns handlerClass:(Class)handlerClass {
    for (NSString *routePattern in routePatterns) {
        [self addRoute:routePattern handlerClass:handlerClass];
    }
}

+ (void)removeScheme:(nullable NSString *)scheme route:(nullable NSString *)routePattern {
    MLSRoutes *routesControl = scheme.length > 0 ? [MLSRoutes routesForScheme:scheme] : [MLSRoutes globalRoutes];
    routePattern.length > 0 ? ([routesControl removeRoute:routePattern]) : ([routesControl removeAllRoutes]);
}

- (void)removeRoute:(NSString *)routePattern {
    if (![routePattern hasPrefix:@"/"]) {
        routePattern = [NSString stringWithFormat:@"/%@", routePattern];
    }
    
    NSInteger routeIndex = NSNotFound;
    NSInteger index = 0;
    
    for (MLSRouteDefinition *route in [self.mutableRoutes copy]) {
        if ([route.pattern isEqualToString:routePattern]) {
            routeIndex = index;
            break;
        }
        index++;
    }
    
    if (routeIndex != NSNotFound) {
        [self.mutableRoutes removeObjectAtIndex:(NSUInteger)routeIndex];
    }
}

- (void)removeAllRoutes {
    [self.mutableRoutes removeAllObjects];
}

- (void)setObject:(id)obj forKeyedSubscript:(NSString *)routePatten {
    
    
    NSString *route = (NSString *)routePatten;
    if (!([route isKindOfClass:[NSString class]] && route.length)) {
        return;
    }
    
    if (!obj) {
        [self removeRoute:route];
    }
    else if ([obj isKindOfClass:NSClassFromString(@"NSBlock")]) {
        [self addRoute:routePatten handler:obj];
    }
    else if (class_isMetaClass(object_getClass(obj)) &&
             [obj isSubclassOfClass:[UIViewController class]]) {
        [self addRoute:routePatten handlerClass:obj];
    }
}

- (NSArray <MLSRouteDefinition *> *)routes; {
    return [self.mutableRoutes copy];
}

#pragma mark - Routing URLs

+ (BOOL)canRouteURL:(NSURL *)URL {
    return [[self _routesControllerForURL:URL] canRouteURL:URL];
}

- (BOOL)canRouteURL:(NSURL *)URL {
    return [self _routeURL:URL withParameters:nil executeRouteBlock:NO handler:nil];
}

+ (BOOL)routeURL:(NSURL *)URL handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock {
    return [[self _routesControllerForURL:URL] routeURL:URL handler:handlerBlock];
}

- (BOOL)routeURL:(NSURL *)URL handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock {
    return [self _routeURL:URL withParameters:nil executeRouteBlock:YES handler:handlerBlock];
}

+ (BOOL)routeURL:(NSURL *)URL withParameters:(nullable NSDictionary  * )parameters handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock {
    return [[self _routesControllerForURL:URL] routeURL:URL withParameters:parameters handler:handlerBlock];
}

+ (id)objectForURL:(NSURL *)URL withParameters:(NSDictionary<NSString *,id> *)parameters {
    __block id routeObj = nil;
    [[self _routesControllerForURL:URL] routeURL:URL withParameters:parameters handler:^BOOL(NSMutableDictionary<NSString *,id> * _Nullable parameters, id  _Nonnull targetObj) {
        routeObj = targetObj;
    }];
    return routeObj;
}

- (BOOL)routeURL:(NSURL *)URL withParameters:(nullable NSDictionary  * )parameters handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock {
    return [self _routeURL:URL withParameters:parameters executeRouteBlock:YES handler:handlerBlock];
}



#pragma mark - Private

+ (instancetype)_routesControllerForURL:(NSURL *)URL {
    if (URL == nil) {
        return nil;
    }
    
    return routeControllersMap[URL.scheme] ?: [MLSRoutes globalRoutes];
}

- (void)_registerRoute:(MLSRouteDefinition *)route {
    if (route.priority == 0 || self.mutableRoutes.count == 0) {
        [self.mutableRoutes addObject:route];
    } else {
        NSUInteger index = 0;
        BOOL addedRoute = NO;
        
        // search through existing routes looking for a lower priority route than this one
        for (MLSRouteDefinition *existingRoute in [self.mutableRoutes copy]) {
            if (existingRoute.priority < route.priority) {
                // if found, add the route after it
                [self.mutableRoutes insertObject:route atIndex:index];
                addedRoute = YES;
                break;
            }
            index++;
        }
        
        // if we weren't able to find a lower priority route, this is the new lowest priority route (or same priority as self.routes.lastObject) and should just be added
        if (!addedRoute) {
            [self.mutableRoutes addObject:route];
        }
    }
}

- (BOOL)_routeURL:(NSURL *)URL withParameters:(nullable NSDictionary  * )parameters executeRouteBlock:(BOOL)executeRouteBlock handler:(nullable MLSRouteHandleTargetCallBackBlock)handlerBlock {
    if (!URL) {
        return NO;
    }
    
    [self _verboseLog:@"Trying to route URL %@", URL];
    
    BOOL didRoute = NO;
    MLSRouteRequest *request = [[MLSRouteRequest alloc] initWithURL:URL alwaysTreatsHostAsPathComponent:alwaysTreatsHostAsPathComponent];
    // 匹配的表达式
    
    for (MLSRouteDefinition *route in [self.mutableRoutes copy]) {
        // check each route for a matching response
        MLSRouteResponse *response = [route routeResponseForRequest:request decodePlusSymbols:shouldDecodePlusSymbols];
        if (!response.isMatch) {
            continue;
        }
        
        [self _verboseLog:@"Successfully matched %@", route];
        
        if (!executeRouteBlock) {
            // if we shouldn't execute but it was a match, we're done now
            return YES;
        }
        
        // configure the final parameters
        NSMutableDictionary *finalParameters = [NSMutableDictionary dictionary];
        if (response.parameters) {
            [finalParameters addEntriesFromDictionary:response.parameters];
        }
        if (parameters) {
            [finalParameters addEntriesFromDictionary:parameters];
        }
        [self _verboseLog:@"Final parameters are %@", finalParameters];
        
        id routeObj = nil;
        if (route.targetControllerClass) {
            didRoute = [route callControllerHandlerBlockWithParameters:finalParameters];
        } else {
            didRoute = [route canCallHandlerBlockWithParameters:finalParameters];
            if (didRoute) {
                routeObj = [route callHandlerBlockWithParameters:finalParameters];
            }
        }
        UIViewController <MLSRouteDefinitionTargetController>*vc = route.targetViewController;
        if (routeObj == nil) {
            routeObj = vc;
        }
        route.targetViewController = nil;
        route.handlerVCBlock = nil;
        if (didRoute) {
            if (handlerBlock) {
                handlerBlock(finalParameters, routeObj);
            }
            break;
        }
    }
    
    if (!didRoute) {
        [self _verboseLog:@"Could not find a matching route"];
    }
    
    // if we couldn't find a match and this routes controller specifies to fallback and its also not the global routes controller, then...
    if (!didRoute && self.shouldFallbackToGlobalRoutes && ![self _isGlobalRoutesController]) {
        [self _verboseLog:@"Falling back to global routes..."];
        didRoute = [[MLSRoutes globalRoutes] _routeURL:URL withParameters:parameters executeRouteBlock:executeRouteBlock handler:handlerBlock];
    }
    
    // if, after everything, we did not route anything and we have an unmatched URL handler, then call it
    if (!didRoute && executeRouteBlock && self.unmatchedURLHandler) {
        [self _verboseLog:@"Falling back to the unmatched URL handler"];
        self.unmatchedURLHandler(self, URL, parameters);
    }
    
    return didRoute;
}

- (BOOL)_isGlobalRoutesController {
    return [self.scheme isEqualToString:MLSRoutesGlobalRoutesScheme];
}

- (void)_verboseLog:(NSString *)format, ... {
    if (!verboseLoggingEnabled || format.length == 0) {
        return;
    }
    
    va_list argsList;
    va_start(argsList, format);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wformat-nonliteral"
    NSString *formattedLogMessage = [[NSString alloc] initWithFormat:format arguments:argsList];
#pragma clang diagnostic pop
    
    va_end(argsList);
    NSLog(@"[MLSRoutes]: %@", formattedLogMessage);
}

@end


#pragma mark - Global Options

@implementation MLSRoutes (GlobalOptions)

+ (void)setVerboseLoggingEnabled:(BOOL)loggingEnabled {
    verboseLoggingEnabled = loggingEnabled;
}

+ (BOOL)isVerboseLoggingEnabled {
    return verboseLoggingEnabled;
}

+ (void)setShouldDecodePlusSymbols:(BOOL)shouldDecode {
    shouldDecodePlusSymbols = shouldDecode;
}

+ (BOOL)shouldDecodePlusSymbols {
    return shouldDecodePlusSymbols;
}

+ (void)setAlwaysTreatsHostAsPathComponent:(BOOL)treatsHostAsPathComponent {
    alwaysTreatsHostAsPathComponent = treatsHostAsPathComponent;
}

+ (BOOL)alwaysTreatsHostAsPathComponent {
    return alwaysTreatsHostAsPathComponent;
}

@end
@implementation MLSRoutes (Generate)
+ (NSString *)generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters {
    [self configGlobalScheme];
    NSInteger startIndexOfColon = 0;
    
    NSMutableArray *placeholders = [NSMutableArray array];
    
    for (int i = 0; i < pattern.length; i++) {
        NSString *character = [NSString stringWithFormat:@"%c", [pattern characterAtIndex:i]];
        if ([character isEqualToString:@":"]) {
            startIndexOfColon = i;
        }
        if ([specialCharacters rangeOfString:character].location != NSNotFound && i > (startIndexOfColon + 1) && startIndexOfColon) {
            NSRange range = NSMakeRange(startIndexOfColon, i - startIndexOfColon);
            NSString *placeholder = [pattern substringWithRange:range];
            if (![self checkIfContainsSpecialCharacter:placeholder]) {
                [placeholders addObject:placeholder];
                startIndexOfColon = 0;
            }
        }
        if (i == pattern.length - 1 && startIndexOfColon) {
            NSRange range = NSMakeRange(startIndexOfColon, i - startIndexOfColon + 1);
            NSString *placeholder = [pattern substringWithRange:range];
            if (![self checkIfContainsSpecialCharacter:placeholder]) {
                [placeholders addObject:placeholder];
            }
        }
    }
    
    __block NSString *parsedResult = pattern;
    
    [placeholders enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        idx = parameters.count > idx ? idx : parameters.count - 1;
        id paramStr = parameters[idx];
        if (![paramStr isKindOfClass:NSString.class]) {
            paramStr = [NSString stringWithFormat:@"%@",paramStr];
        }
        parsedResult = [parsedResult stringByReplacingOccurrencesOfString:obj withString:paramStr];
    }];
    
    return parsedResult;
}
+ (BOOL)checkIfContainsSpecialCharacter:(NSString *)checkedString {
    NSCharacterSet *specialCharactersSet = [NSCharacterSet characterSetWithCharactersInString:specialCharacters];
    return [checkedString rangeOfCharacterFromSet:specialCharactersSet].location != NSNotFound;
}
@end
