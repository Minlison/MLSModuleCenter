//
//  MLSRouteRequest.h
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 MLSRouteRequest is a model representing a request to route a URL.
 It gets parsed into path components and query parameters, which are then used by MLSRouteDefinition to attempt a match.
 */

@interface MLSRouteRequest : NSObject

/// The URL being routed.
@property (nonatomic, strong, readonly) NSURL *URL;

/// The URL's path components.
@property (nonatomic, strong, readonly) NSArray *pathComponents;

/// The URL's query parameters.
@property (nonatomic, strong, readonly) NSDictionary *queryParams;


///-------------------------------
/// @name Creating Route Requests
///-------------------------------


/**
 Creates a new route request.
 
 @param URL The URL to route.
 @param alwaysTreatsHostAsPathComponent The global option for if to treat the URL host as a path component or not.
 
 @returns The newly initialized route request.
 */
- (instancetype)initWithURL:(NSURL *)URL alwaysTreatsHostAsPathComponent:(BOOL)alwaysTreatsHostAsPathComponent NS_DESIGNATED_INITIALIZER;

/// Unavailable, use initWithURL:alwaysTreatsHostAsPathComponent: instead.
- (instancetype)init NS_UNAVAILABLE;

/// Unavailable, use initWithURL:alwaysTreatsHostAsPathComponent: instead.
+ (instancetype)new NS_UNAVAILABLE;

@end


NS_ASSUME_NONNULL_END
