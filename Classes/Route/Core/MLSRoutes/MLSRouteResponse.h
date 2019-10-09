//
//  MLSRouteResponse.h
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 MLSRouteResponse is the response from attempting to route a MLSRouteRequest.
 */

@interface MLSRouteResponse : NSObject

/// Indicates if the response is a match or not.
@property (nonatomic, assign, readonly, getter=isMatch) BOOL match;

/// The match parameters (or nil for an invalid response).
@property (nonatomic, strong, readonly, nullable) NSDictionary *parameters;


///-------------------------------
/// @name Creating Responses
///-------------------------------


/// Creates an invalid match response.
+ (instancetype)invalidMatchResponse;

/// Creates a valid match response with the given parameters.
+ (instancetype)validMatchResponseWithParameters:(NSDictionary *)parameters;

/// Unavailable, please use +invalidMatchResponse or +validMatchResponseWithParameters: instead.
- (instancetype)init NS_UNAVAILABLE;

/// Unavailable, please use +invalidMatchResponse or +validMatchResponseWithParameters: instead.
+ (instancetype)new NS_UNAVAILABLE;

@end


NS_ASSUME_NONNULL_END
