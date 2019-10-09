//
//  MLSParsingUtilities.h
//  MLSModuleCenter
//
//  Created by MinLison on 2018/5/7.
//  Copyright © 2018年 MinLison. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface MLSParsingUtilities : NSObject

+ (NSString *)variableValueFrom:(NSString *)value decodePlusSymbols:(BOOL)decodePlusSymbols;

+ (NSDictionary *)queryParams:(NSDictionary *)queryParams decodePlusSymbols:(BOOL)decodePlusSymbols;

+ (NSArray <NSString *> *)expandOptionalRoutePatternsForPattern:(NSString *)routePattern;

@end


NS_ASSUME_NONNULL_END
