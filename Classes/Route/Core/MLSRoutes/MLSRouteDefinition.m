//
//  MLSRouteDefinition.m
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import "MLSRouteDefinition.h"
#import "MLSRoutes.h"
#import "MLSParsingUtilities.h"


@interface MLSRouteDefinition ()

@property (nonatomic, copy) NSString *pattern;
@property (nonatomic, copy) NSString *scheme;
@property (nonatomic, assign) NSUInteger priority;
@property (nonatomic, copy) MLSRouteHandlerParamsCallBackBlock handlerBlock;

@property (nonatomic, strong) NSArray *patternComponents;

@end


@implementation MLSRouteDefinition

- (instancetype)initWithScheme:(NSString *)scheme pattern:(NSString *)pattern priority:(NSUInteger)priority handlerBlock:(nullable MLSRouteHandlerParamsCallBackBlock)handlerBlock
{
    if ((self = [super init])) {
        self.scheme = scheme;
        self.pattern = pattern;
        self.priority = priority;
        self.handlerBlock = handlerBlock;
        
        if ([pattern characterAtIndex:0] == '/') {
            pattern = [pattern substringFromIndex:1];
        }
        
        self.patternComponents = [pattern componentsSeparatedByString:@"/"];
    }
    return self;
}
- (instancetype)initWithScheme:(NSString *)scheme pattern:(NSString *)pattern priority:(NSUInteger)priority handlerClass:(Class)handlerClass
{
	if ((self = [super init])) {
		self.scheme = scheme;
		self.pattern = pattern;
		self.priority = priority;
		self.targetControllerClass  = handlerClass;
		
		if ([pattern characterAtIndex:0] == '/') {
			pattern = [pattern substringFromIndex:1];
		}
		
		self.patternComponents = [pattern componentsSeparatedByString:@"/"];
	}
	return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@ %p> - %@ (priority: %@)", NSStringFromClass([self class]), self, self.pattern, @(self.priority)];
}

- (MLSRouteResponse *)routeResponseForRequest:(MLSRouteRequest *)request decodePlusSymbols:(BOOL)decodePlusSymbols
{
    BOOL patternContainsWildcard = [self.patternComponents containsObject:@"*"];
    
    if (request.pathComponents.count != self.patternComponents.count && !patternContainsWildcard) {
        // definitely not a match, nothing left to do
        return [MLSRouteResponse invalidMatchResponse];
    }
    
    MLSRouteResponse *response = [MLSRouteResponse invalidMatchResponse];
    NSMutableDictionary *routeParams = [NSMutableDictionary dictionary];
    BOOL isMatch = YES;
    NSUInteger index = 0;
    
    for (NSString *patternComponent in self.patternComponents) {
        NSString *URLComponent = nil;
        
        // figure out which URLComponent it is, taking wildcards into account
        if (index < [request.pathComponents count]) {
            URLComponent = request.pathComponents[index];
        } else if ([patternComponent isEqualToString:@"*"]) {
            // match /foo by /foo/*
            URLComponent = [request.pathComponents lastObject];
        }
        
        if ([patternComponent hasPrefix:@":"]) {
            // this is a variable, set it in the params
            NSString *variableName = [self variableNameForValue:patternComponent];
            NSString *variableValue = [self variableValueForValue:URLComponent decodePlusSymbols:decodePlusSymbols];
            routeParams[variableName] = variableValue;
        } else if ([patternComponent isEqualToString:@"*"]) {
            // match wildcards
            NSUInteger minRequiredParams = index;
            if (request.pathComponents.count >= minRequiredParams) {
                // match: /a/b/c/* has to be matched by at least /a/b/c
                routeParams[MLSRouteWildcardComponentsKey] = [request.pathComponents subarrayWithRange:NSMakeRange(index, request.pathComponents.count - index)];
                isMatch = YES;
            } else {
                // not a match: /a/b/c/* cannot be matched by URL /a/b/
                isMatch = NO;
            }
            break;
        } else if (![patternComponent isEqualToString:URLComponent]) {
            // break if this is a static component and it isn't a match
            isMatch = NO;
            break;
        }
        index++;
    }
    
    if (isMatch) {
        // if it's a match, set up the param dictionary and create a valid match response
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [params addEntriesFromDictionary:[MLSParsingUtilities queryParams:request.queryParams decodePlusSymbols:decodePlusSymbols]];
        [params addEntriesFromDictionary:routeParams];
        [params addEntriesFromDictionary:[self baseMatchParametersForRequest:request]];
        response = [MLSRouteResponse validMatchResponseWithParameters:[params copy]];
    }
    
    return response;
}

- (NSString *)variableNameForValue:(NSString *)value
{
    NSString *name = [value substringFromIndex:1];
    
    if (name.length > 1 && [name characterAtIndex:0] == ':') {
        // Strip off the ':' in front of param names
        name = [name substringFromIndex:1];
    }
    
    if (name.length > 1 && [name characterAtIndex:name.length - 1] == '#') {
        // Strip of trailing fragment
        name = [name substringToIndex:name.length - 1];
    }
    
    return name;
}

- (NSString *)variableValueForValue:(NSString *)value decodePlusSymbols:(BOOL)decodePlusSymbols
{
    NSString *var = [value stringByRemovingPercentEncoding];
    
    if (var.length > 1 && [var characterAtIndex:var.length - 1] == '#') {
        // Strip of trailing fragment
        var = [var substringToIndex:var.length - 1];
    }
    
    var = [MLSParsingUtilities variableValueFrom:var decodePlusSymbols:decodePlusSymbols];
    
    return var;
}

- (NSDictionary *)baseMatchParametersForRequest:(MLSRouteRequest *)request
{
    return @{MLSRoutePatternKey: self.pattern ?: [NSNull null], MLSRouteURLKey: request.URL ?: [NSNull null], MLSRouteSchemeKey: self.scheme ?: [NSNull null]};
}

- (BOOL)canCallHandlerBlockWithParameters:(NSMutableDictionary *)parameters
{
    if (self.handlerBlock == nil) {
        return NO;
    }
    
    return YES;
}

- (id)callHandlerBlockWithParameters:(NSMutableDictionary *)parameters
{
    if (self.handlerBlock == nil) {
        return nil;
    }
    
    return self.handlerBlock(parameters);
}
- (BOOL)callControllerHandlerBlockWithParameters:(NSMutableDictionary *)parameters
{
	if ( !self.targetControllerClass || !([self.targetControllerClass conformsToProtocol:@protocol(MLSRouteDefinitionTargetController)] || [self.targetControllerClass respondsToSelector:@selector(targetControllerWithParams:)])) {
		return NO;
	}
	
        UIViewController <MLSRouteDefinitionTargetController> *vc = [self.targetControllerClass targetControllerWithParams:parameters];
        self.targetViewController = vc;
        
	if (self.handlerVCBlock == nil) {
		return YES;
	}
        self.targetViewController = nil;
	return self.handlerVCBlock(vc);
}
@end
