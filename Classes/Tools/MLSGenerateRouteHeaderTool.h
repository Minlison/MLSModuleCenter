//
//  MLSGenerateRouteHeaderTool.h
//  MLSModuleCenter
//
//  Created by MinLison on 2019/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLSGenerateRouteHeaderTool : NSObject
/**
 生成路由参数列表文件
 默认某块名为 bundleID 的最后一部分大写
 @param dir 输出路径
 */
+ (void)generateRoutesHeaderToDir:(NSString *)dir;

/**
 生成路由参数头文件

 @param dir 路径
 @param headerName 头文件名
 */
+ (void)generateRoutesHeaderToDir:(NSString *)dir headerName:(NSString *)headerName;
@end

NS_ASSUME_NONNULL_END
