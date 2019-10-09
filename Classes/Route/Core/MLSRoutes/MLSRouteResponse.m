//
//  MLSRouteResponse.m
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//

#import "MLSRouteResponse.h"


@interface MLSRouteResponse ()

@property (nonatomic, assign, getter=isMatch) BOOL match;
@property (nonatomic, strong) NSDictionary *parameters;

@end


@implementation MLSRouteResponse

+ (instancetype)invalidMatchResponse
{
    MLSRouteResponse *response = [[[self class] alloc] init];
    response.match = NO;
    return response;
}

+ (instancetype)validMatchResponseWithParameters:(NSDictionary *)parameters
{
    MLSRouteResponse *response = [[[self class] alloc] init];
    response.match = YES;
    response.parameters = parameters;
    return response;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@ %p> - match: %@, params: %@", NSStringFromClass([self class]), self, (self.match ? @"YES" : @"NO"), self.parameters];
}

@end
