//
//  MLSGenerateRouteHeaderTool.m
//  MLSModuleCenter
//
//  Created by MinLison on 2019/2/26.
//
#import <UIKit/UIKit.h>
#import "MLSGenerateRouteHeaderTool.h"
#import <MLSModuleCenter/MLSModuleCenter.h>
@interface MLSGenerateRouteHeaderTool()
@property (nonatomic, strong) NSMutableDictionary <NSString *, NSMutableArray <NSString *>*>*targetInterfaces;
@property (nonatomic, strong) NSMutableDictionary <NSString *, NSMutableArray <NSString *>*>*targetImplementations;
@end
@implementation MLSGenerateRouteHeaderTool
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static MLSGenerateRouteHeaderTool *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.targetInterfaces = [[NSMutableDictionary alloc] init];
        self.targetImplementations = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (void)generateRoutesHeaderToDir:(NSString *)dir {
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString *moudleName = [bundleIdentifier componentsSeparatedByString:@"."].lastObject.capitalizedString;
    [self generateRoutesHeaderToDir:dir moudleName:moudleName];
}

+ (void)generateRoutesHeaderToDir:(NSString *)dir moudleName:(NSString *)moudleName {
    [[self sharedInstance] generateRoutesHeaderToDir:dir moudleName:moudleName];
}

- (void)createOrInsertMethodInterface:(NSString *)methodInterface toTarget:(NSString *)target {
    NSMutableArray <NSString *>*array = [self.targetInterfaces objectForKey:target];
    if (array == nil) {
        array = [[NSMutableArray alloc] init];
        [self.targetInterfaces setObject:array forKey:target];
    }
    [array addObject:methodInterface];
}

- (void)createOrInsertMethodImp:(NSString *)methodImp toTarget:(NSString *)target {
    NSMutableArray <NSString *>*array = [self.targetImplementations objectForKey:target];
    if (array == nil) {
        array = [[NSMutableArray alloc] init];
        [self.targetImplementations setObject:array forKey:target];
    }
    [array addObject:methodImp];
}

- (void)generateRoutesHeaderToDir:(NSString *)dir moudleName:(NSString *)moudleName {
    
    NSLog(@"===============BEGIN GENERATE ROUTES HEADERS ================");
    
    [MLSRoutes.allRoutes enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull arrayKey, NSArray<MLSRouteDefinition *> * _Nonnull arrayObj, BOOL * _Nonnull arrayStop) {
        [arrayObj enumerateObjectsUsingBlock:^(MLSRouteDefinition * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableString *methodInterfaceString = [[NSMutableString alloc] init];
            NSMutableString *methodImpString = [[NSMutableString alloc] init];
            NSRange queryRange = [obj.pattern rangeOfString:@"?"];
            NSString *pathString = obj.pattern;
            if (queryRange.location != NSNotFound) {
                pathString = [obj.pattern substringWithRange:NSMakeRange(0, queryRange.location)];
            }
            if ([[pathString substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"/"]) {
                pathString = [pathString stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
            }
            NSArray <NSString *>* pathComponents = [pathString componentsSeparatedByString:@"/"];
            NSString *target = obj.identifier;
            [self createOrInsertMethodInterface:methodInterfaceString toTarget:target];
            [self createOrInsertMethodImp:methodImpString toTarget:target];
            
            // Interface
            [methodInterfaceString appendFormat:@"// 目标控制器 %@\n", pathComponents.firstObject];
            [methodInterfaceString appendFormat:@"// urlPatten %@\n", obj.pattern];
            [methodInterfaceString appendFormat:@"// 快速创建url\n"];
            [methodInterfaceString appendFormat:@"+ (NSURL *)URLForRoute"];
            
            // Imp
            [methodImpString appendFormat:@"+ (NSURL *)URLForRoute"];
            NSMutableString *methodBodyString = [[NSMutableString alloc] initWithString:@"      NSString *routeString = [NSString stringWithFormat:@\""];
            
            NSMutableString *methodBodyStringFormat = [[NSMutableString alloc] initWithFormat:@"%@:/",obj.scheme];
            NSMutableString *methodBodyStringFormatValue = [[NSMutableString alloc] init];
            __block BOOL isFirstParam = YES;
            [pathComponents enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                // 参数
                if ([obj containsString:@":"]) {
                    NSString *valueStr = [obj stringByReplacingOccurrencesOfString:@":" withString:@""];
                    
                    NSString *capitalizedChar = [[valueStr substringWithRange:NSMakeRange(0, 1)] uppercaseString];
                    NSString *lowercaseChar = [[valueStr substringWithRange:NSMakeRange(0, 1)] lowercaseString];
                    
                    NSString *tmpParam = [valueStr stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:lowercaseChar];
                    
                    NSString *tmpValue = [valueStr stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:lowercaseChar];
                    if (isFirstParam) {
                        tmpParam = [tmpParam stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:capitalizedChar];
                        isFirstParam = NO;
                    }
                    [methodInterfaceString appendFormat:@"%@:(NSString *)%@ ",tmpParam,tmpValue];
                    [methodImpString appendFormat:@"%@:(NSString *)%@ ",tmpParam,tmpValue];
                    
                    [methodBodyStringFormat appendFormat:@"/%%@"]; //scheme://path/%@
                    [methodBodyStringFormatValue appendFormat:@",%@",valueStr];
                } else {
                    NSString *capitalizedChar = [[obj substringWithRange:NSMakeRange(0, 1)] uppercaseString];
                    NSString *tmpParam = [obj stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:capitalizedChar];
                    
                    [methodInterfaceString appendFormat:@"%@",tmpParam];
                    [methodImpString appendFormat:@"%@",tmpParam];
                    [methodBodyStringFormat appendFormat:@"/%@",obj];
                }
            }];
            
            NSString *interfaceLastString = [methodInterfaceString substringWithRange:NSMakeRange(methodInterfaceString.length - 1, 1)];
            if ([interfaceLastString isEqualToString:@" "]) {
                [methodInterfaceString replaceCharactersInRange:NSMakeRange(methodInterfaceString.length - 1, 1) withString:@""];
            }
            [methodInterfaceString appendString:@";\n\n"];
            [methodImpString appendString:@" {\n"];
            
            [methodBodyString appendFormat:@"%@\"%@];\n",methodBodyStringFormat, methodBodyStringFormatValue];
            [methodBodyString appendFormat:@"       routeString = [routeString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];\n"];
            [methodBodyString appendFormat:@"       return [NSURL URLWithString:routeString];\n"];
            
            [methodImpString appendString:methodBodyString];
            [methodImpString appendFormat:@"}\n"];
        }];
    }];
    
    // 创建文件
    NSMutableString *headerFileString = [[NSMutableString alloc] initWithFormat:@"// %@ Auto Create \n// Not Modify \n// Date: %@ \n\n",moudleName, NSDate.date];
    [headerFileString appendFormat:@"#import <UIKit/UIKit.h>\n\n\n"];
    [headerFileString appendFormat:@"#ifndef %@RouteHeader_h\n",moudleName];
    [headerFileString appendFormat:@"#define %@RouteHeader_h\n\n\n\n",moudleName];
    
    
    NSMutableString *mFileString = [[NSMutableString alloc] initWithFormat:@"// %@ Auto Create \n// Not Modify \n// Date: %@\n\n",moudleName, NSDate.date];
    [mFileString appendFormat:@"#import \"%@.h\"\n\n\n\n",moudleName];
    
    NSArray <NSString *>*keys = [self.targetImplementations.allKeys sortedArrayUsingSelector:@selector(compare:)];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull target, NSUInteger targetidx, BOOL * _Nonnull targetStop) {
        [headerFileString appendFormat:@"@interface NSURL (%@_Routes)\n\n",target];
        [mFileString appendFormat:@"@implementation NSURL (%@_Routes)\n\n",target];
        
        // 方法
        [self.targetInterfaces[target] enumerateObjectsUsingBlock:^(NSString * _Nonnull interface, NSUInteger interfaceIdx, BOOL * _Nonnull interfacestop) {
            [headerFileString appendString:interface];
        }];
        [self.targetImplementations[target] enumerateObjectsUsingBlock:^(NSString * _Nonnull imp, NSUInteger impIdx, BOOL * _Nonnull impStop) {
            [mFileString appendString:imp];
        }];
        
        [headerFileString appendFormat:@"@end\n\n"];
        [mFileString appendFormat:@"@end\n\n"];
    }];
    
    [headerFileString appendFormat:@"#endif // %@_h\n", moudleName];
    
    BOOL isDir = NO;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:dir isDirectory:&isDir];
    if (!isDir || !isExist) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *headerPath = [dir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@RouteHeader.h", moudleName]];
    NSString *impPath = [dir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@RouteHeader.m", moudleName]];
    NSError *error = nil;
    [headerFileString writeToFile:headerPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [mFileString writeToFile:impPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error != nil) {
        NSLog(@"===============FAILED GENERATE ROUTES HEADERS %@================",error);
    } else {
        NSLog(@"===============END GENERATE ROUTES HEADERS ================");
    }
    
}


@end
