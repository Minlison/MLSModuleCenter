//
//  MLSParsingUtilities.m
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import "MLSParsingUtilities.h"


@interface NSArray (Combinations)

- (NSArray<NSArray *> *)MLSRoutes_allOrderedCombinations;

@end


@implementation MLSParsingUtilities

+ (NSString *)variableValueFrom:(NSString *)value decodePlusSymbols:(BOOL)decodePlusSymbols
{
    if (!decodePlusSymbols) {
        return value;
    }
    return [value stringByReplacingOccurrencesOfString:@"+" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, value.length)];
}

+ (NSDictionary *)queryParams:(NSDictionary *)queryParams decodePlusSymbols:(BOOL)decodePlusSymbols
{
    if (!decodePlusSymbols) {
        return queryParams;
    }
    
    NSMutableDictionary *updatedQueryParams = [NSMutableDictionary dictionary];
    
    for (NSString *name in queryParams) {
        id value = queryParams[name];
        
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *variables = [NSMutableArray array];
            for (NSString *arrayValue in (NSArray *)value) {
                [variables addObject:[self variableValueFrom:arrayValue decodePlusSymbols:YES]];
            }
            updatedQueryParams[name] = [variables copy];
        } else if ([value isKindOfClass:[NSString class]]) {
            NSString *variable = [self variableValueFrom:value decodePlusSymbols:YES];
            updatedQueryParams[name] = variable;
        } else {
            NSAssert(NO, @"Unexpected query parameter type: %@", NSStringFromClass([value class]));
        }
    }
    
    return [updatedQueryParams copy];
}

+ (NSArray <NSString *> *)expandOptionalRoutePatternsForPattern:(NSString *)routePattern
{
    /* this method exists to take a route pattern that is known to contain optional params, such as:
     
     /path/:thing/(/a)(/b)(/c)
     
     and create the following paths:
     
     /path/:thing/a/b/c
     /path/:thing/a/b
     /path/:thing/a/c
     /path/:thing/b/a
     /path/:thing/a
     /path/:thing/b
     /path/:thing/c
     */
    
    if ([routePattern rangeOfString:@"("].location == NSNotFound) {
        return @[];
    }
    
    NSString *baseRoute = nil;
    NSArray *components = [self _optionalComponentsForPattern:routePattern baseRoute:&baseRoute];
    NSArray *routes = [self _routesForOptionalComponents:components baseRoute:baseRoute];
    
    return routes;
}

+ (NSArray <NSString *> *)_optionalComponentsForPattern:(NSString *)routePattern baseRoute:(NSString *__autoreleasing *)outBaseRoute;
{
    if (routePattern.length == 0) {
        return @[];
    }
    
    NSMutableArray *optionalComponents = [NSMutableArray array];
    
    NSScanner *scanner = [NSScanner scannerWithString:routePattern];
    NSString *nonOptionalRouteSubpath = nil;
    
    BOOL parsedBaseRoute = NO;
    BOOL parseError = NO;
    
    // first, we need to parse the string and find the array of optional params.
    // aka, take (/a)(/b)(/c) and turn it into ["/a", "/b", "/c"]
    while ([scanner scanUpToString:@"(" intoString:&nonOptionalRouteSubpath]) {
        if ([scanner isAtEnd]) {
            break;
        }
        
        if (nonOptionalRouteSubpath.length > 0 && outBaseRoute != NULL && !parsedBaseRoute) {
            // the first 'non optional subpath' is always the base route
            *outBaseRoute = nonOptionalRouteSubpath;
            parsedBaseRoute = YES;
        }
        
        scanner.scanLocation = scanner.scanLocation + 1;
        
        NSString *component = nil;
        if (![scanner scanUpToString:@")" intoString:&component]) {
            parseError = YES;
            break;
        }
        
        [optionalComponents addObject:component];
    }
    
    if (parseError) {
        NSLog(@"[MLSRoutes]: Parse error, unsupported route: %@", routePattern);
        return @[];
    }
    
    return [optionalComponents copy];
}

+ (NSArray <NSString *> *)_routesForOptionalComponents:(NSArray <NSString *> *)optionalComponents baseRoute:(NSString *)baseRoute
{
    if (optionalComponents.count == 0 || baseRoute.length == 0) {
        return @[];
    }
    
    NSMutableArray *routes = [NSMutableArray array];
    
    // generate all possible combinations of the components that could exist (taking order into account)
    // aka, "/path/:thing/(/a)(/b)(/c)" should never generate a route for "/path/:thing/(/b)(/a)"
    NSArray *combinations = [optionalComponents MLSRoutes_allOrderedCombinations];
    
    // generate the actual final route path strings
    for (NSArray *components in combinations) {
        NSString *path = [components componentsJoinedByString:@""];
        [routes addObject:[baseRoute stringByAppendingString:path]];
    }
    
    // sort them so that the longest routes are first (since they are the most selective)
    [routes sortUsingSelector:@selector(length)];
    
    return [routes copy];
}

@end


@implementation NSArray (MLSRoutes)

- (NSArray<NSArray *> *)MLSRoutes_allOrderedCombinations
{
    NSInteger length = self.count;
    if (length == 0) {
        return [NSArray arrayWithObject:[NSArray array]];
    }
    
    id lastObject = [self lastObject];
    NSArray *subarray = [self subarrayWithRange:NSMakeRange(0, length - 1)];
    NSArray *subarrayCombinations = [subarray MLSRoutes_allOrderedCombinations];
    NSMutableArray *combinations = [NSMutableArray arrayWithArray:subarrayCombinations];
    
    for (NSArray *subarrayCombos in subarrayCombinations) {
        [combinations addObject:[subarrayCombos arrayByAddingObject:lastObject]];
    }
    
    return [NSArray arrayWithArray:combinations];
}

@end
