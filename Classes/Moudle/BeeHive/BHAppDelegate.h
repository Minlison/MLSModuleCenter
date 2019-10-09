/**
 * Created by BeeHive.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the GNU GENERAL PUBLIC LICENSE.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
#import <UserNotifications/UserNotifications.h>
#endif


@interface BHAppDelegate : UIResponder <UIApplicationDelegate>

@end

typedef void (^BHNotificationResultHandler)(UIBackgroundFetchResult);
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
typedef void (^BHNotificationPresentationOptionsHandler)(UNNotificationPresentationOptions options) NS_AVAILABLE_IOS(10.0);
typedef void (^BHNotificationCompletionHandler)(void);
#endif

@interface BHNotificationsItem : NSObject

@property (nonatomic, strong) NSError *notificationsError;
@property (nonatomic, strong) NSData *deviceToken;
@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, copy) BHNotificationResultHandler notificationResultHander;
@property (nonatomic, strong) UILocalNotification *localNotification;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
@property (nonatomic, strong) UNNotification *notification NS_AVAILABLE_IOS(10.0);
@property (nonatomic, strong) UNNotificationResponse *notificationResponse NS_AVAILABLE_IOS(10.0);
@property (nonatomic, copy) BHNotificationPresentationOptionsHandler notificationPresentationOptionsHandler NS_AVAILABLE_IOS(10.0);
@property (nonatomic, copy) BHNotificationCompletionHandler notificationCompletionHandler NS_AVAILABLE_IOS(10.0);
@property (nonatomic, strong) UNUserNotificationCenter *center NS_AVAILABLE_IOS(10.0);
#endif

@end

@interface BHOpenURLItem : NSObject

@property (nonatomic, strong) NSURL *openURL;
@property (nonatomic, copy) NSString *sourceApplication;
@property (nonatomic, strong) id annotation;
@property (nonatomic, strong) NSDictionary *options;

@end

typedef void (^BHShortcutCompletionHandler)(BOOL);

@interface BHShortcutItem : NSObject

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_4
@property(nonatomic, strong) UIApplicationShortcutItem *shortcutItem NS_AVAILABLE_IOS(9.0);
@property(nonatomic, copy) BHShortcutCompletionHandler scompletionHandler;
#endif

@end


typedef void (^BHUserActivityRestorationHandler)(NSArray *);

@interface BHUserActivityItem : NSObject

@property (nonatomic, copy) NSString *userActivityType;
@property (nonatomic, strong) NSUserActivity *userActivity;
@property (nonatomic, strong) NSError *userActivityError;
@property (nonatomic, copy) BHUserActivityRestorationHandler restorationHandler;

@end

typedef void (^BHWatchReplyHandler)(NSDictionary *replyInfo);

@interface BHWatchItem : NSObject

@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, copy) BHWatchReplyHandler replyHandler;

@end

typedef void (^BHBackgroundHandler)(void);
@interface BHBackgroundItem : NSObject
@property(nonatomic, copy) BHBackgroundHandler handler;
@property(nonatomic, copy) NSString *sessionIdentifier;
@end

