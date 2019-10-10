# MLSRoutes Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** MLSRoutes.h  

## Overview

The MLSRoutes class is the main entry-point into the MLSRoutes framework. Used for accessing schemes, managing <a href="#//api/name/routes">routes</a>, and routing URLs.

## Tasks

### Other Methods

[&nbsp;&nbsp;shouldFallbackToGlobalRoutes](#//api/name/shouldFallbackToGlobalRoutes) *property* 

[&nbsp;&nbsp;unmatchedURLHandler](#//api/name/unmatchedURLHandler) *property* 

[&nbsp;&nbsp;globalScheme](#//api/name/globalScheme) *property* 

### Routing Schemes

[+&nbsp;globalRoutes](#//api/name/globalRoutes)  

[+&nbsp;routesForScheme:](#//api/name/routesForScheme:)  

[+&nbsp;unregisterRouteScheme:](#//api/name/unregisterRouteScheme:)  

[+&nbsp;unregisterAllRouteSchemes](#//api/name/unregisterAllRouteSchemes)  

### Managing Routes

[&ndash;&nbsp;addRoute:](#//api/name/addRoute:)  

[&ndash;&nbsp;addRoute:handler:](#//api/name/addRoute:handler:)  

[&ndash;&nbsp;addRoute:priority:handler:](#//api/name/addRoute:priority:handler:)  

[&ndash;&nbsp;addRoute:identifier:priority:handler:](#//api/name/addRoute:identifier:priority:handler:)  

[&ndash;&nbsp;addRoutes:handler:](#//api/name/addRoutes:handler:)  

[&ndash;&nbsp;addRoute:handlerClass:](#//api/name/addRoute:handlerClass:)  

[&ndash;&nbsp;addRoute:identifier:handlerClass:](#//api/name/addRoute:identifier:handlerClass:)  

[&ndash;&nbsp;addRoute:priority:handlerClass:](#//api/name/addRoute:priority:handlerClass:)  

[&ndash;&nbsp;addRoute:identifier:priority:handlerClass:](#//api/name/addRoute:identifier:priority:handlerClass:)  

[&ndash;&nbsp;addRoutes:handlerClass:](#//api/name/addRoutes:handlerClass:)  

[&ndash;&nbsp;removeRoute:](#//api/name/removeRoute:)  

[+&nbsp;removeScheme:route:](#//api/name/removeScheme:route:)  

[&ndash;&nbsp;removeAllRoutes](#//api/name/removeAllRoutes)  

[&ndash;&nbsp;setObject:forKeyedSubscript:](#//api/name/setObject:forKeyedSubscript:)  

[&ndash;&nbsp;routes](#//api/name/routes)  

[+&nbsp;allRoutes](#//api/name/allRoutes)  

### Routing URLs

[+&nbsp;canRouteURL:](#//api/name/canRouteURL:)  

[&ndash;&nbsp;canRouteURL:](#//api/name/canRouteURL:)  

[+&nbsp;routeURL:handler:](#//api/name/routeURL:handler:)  

[&ndash;&nbsp;routeURL:handler:](#//api/name/routeURL:handler:)  

[+&nbsp;routeURL:withParameters:handler:](#//api/name/routeURL:withParameters:handler:)  

[+&nbsp;objectForURL:withParameters:](#//api/name/objectForURL:withParameters:)  

[&ndash;&nbsp;routeURL:withParameters:handler:](#//api/name/routeURL:withParameters:handler:)  

### Generate Methods

[+&nbsp;generateURLWithPattern:parameters:](#//api/name/generateURLWithPattern:parameters:)  

### GlobalOptions Methods

[+&nbsp;setVerboseLoggingEnabled:](#//api/name/setVerboseLoggingEnabled:)  

[+&nbsp;isVerboseLoggingEnabled](#//api/name/isVerboseLoggingEnabled)  

[+&nbsp;setShouldDecodePlusSymbols:](#//api/name/setShouldDecodePlusSymbols:)  

[+&nbsp;shouldDecodePlusSymbols](#//api/name/shouldDecodePlusSymbols)  

[+&nbsp;setAlwaysTreatsHostAsPathComponent:](#//api/name/setAlwaysTreatsHostAsPathComponent:)  

[+&nbsp;alwaysTreatsHostAsPathComponent](#//api/name/alwaysTreatsHostAsPathComponent)  

## Properties

<a name="//api/name/globalScheme" title="globalScheme"></a>
### globalScheme

全局的scheme

`@property (nonatomic, copy, class) NSString *globalScheme`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/shouldFallbackToGlobalRoutes" title="shouldFallbackToGlobalRoutes"></a>
### shouldFallbackToGlobalRoutes

Controls whether or not this router will try to match a URL with global <a href="#//api/name/routes">routes</a> if it can&rsquo;t be matched in the current namespace. Default is NO.

`@property (nonatomic, assign) BOOL shouldFallbackToGlobalRoutes`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/unmatchedURLHandler" title="unmatchedURLHandler"></a>
### unmatchedURLHandler

Called any time routeURL returns NO. Respects <a href="#//api/name/shouldFallbackToGlobalRoutes">shouldFallbackToGlobalRoutes</a>.

`@property (nonatomic, copy, nullable) MLSRouteUnMatchedURLHandlerBlock unmatchedURLHandler`

#### Declared In
* `MLSRoutes.h`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/allRoutes" title="allRoutes"></a>
### allRoutes

All registered <a href="#//api/name/routes">routes</a>, keyed by scheme

`+ (NSDictionary&lt;NSString*,NSArray&lt;MLSRouteDefinition*&gt; *&gt; *)allRoutes`

#### See Also

* `<a href="#//api/name/routes">- routes</a>`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/alwaysTreatsHostAsPathComponent" title="alwaysTreatsHostAsPathComponent"></a>
### alwaysTreatsHostAsPathComponent

Returns if URL host is always considered to be a path component. Defaults to NO.

`+ (BOOL)alwaysTreatsHostAsPathComponent`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/canRouteURL:" title="canRouteURL:"></a>
### canRouteURL:

Returns YES if the provided URL will successfully match against any registered route, NO if not.

`+ (BOOL)canRouteURL:(nullable NSURL *)*URL*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/generateURLWithPattern:parameters:" title="generateURLWithPattern:parameters:"></a>
### generateURLWithPattern:parameters:

调用此方法来拼接 urlpattern 和 parameters

`+ (NSString *)generateURLWithPattern:(NSString *)*pattern* parameters:(NSArray *)*parameters*`

#### Parameters

*pattern*  
&nbsp;&nbsp;&nbsp;url pattern 比如 @&ldquo;beauty/:id&rdquo;  

*parameters*  
&nbsp;&nbsp;&nbsp;一个数组，数量要跟 pattern 里的变量一致  

#### Return Value
返回生成的URL String

#### Discussion
<h1>define MGJ_ROUTE_BEAUTY @&ldquo;beauty/:id&rdquo;</h1>

[MLSRoutes generateURLWithPattern:MGJ_ROUTE_BEAUTY, @[@13]];

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/globalRoutes" title="globalRoutes"></a>
### globalRoutes

Returns the global routing scheme

`+ (instancetype)globalRoutes`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/isVerboseLoggingEnabled" title="isVerboseLoggingEnabled"></a>
### isVerboseLoggingEnabled

Returns current verbose logging enabled state. Defaults to NO.

`+ (BOOL)isVerboseLoggingEnabled`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/objectForURL:withParameters:" title="objectForURL:withParameters:"></a>
### objectForURL:withParameters:

获取 route 的对象

`+ (id)objectForURL:(nullable NSURL *)*URL* withParameters:(nullable NSDictionary&lt;NSString*,id&gt; *)*parameters*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/removeScheme:route:" title="removeScheme:route:"></a>
### removeScheme:route:

移除指定scheme的route
如果 scheme 为空，则移除global的routepattern
如果 routePattern 为空，则移除所有scheme对应的<a href="#//api/name/routes">routes</a>

`+ (void)removeScheme:(nullable NSString *)*scheme* route:(nullable NSString *)*routePattern*`

#### Parameters

*scheme*  
&nbsp;&nbsp;&nbsp;scheme  

*routePattern*  
&nbsp;&nbsp;&nbsp;route  

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/routeURL:handler:" title="routeURL:handler:"></a>
### routeURL:handler:

Routes a URL, calling handler blocks for patterns that match the URL until one returns YES.
If no matching route is found, the <a href="#//api/name/unmatchedURLHandler">unmatchedURLHandler</a> will be called (if set).

`+ (BOOL)routeURL:(nullable NSURL *)*URL* handler:(nullable MLSRouteHandleTargetCallBackBlock)*handlerBlock*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/routeURL:withParameters:handler:" title="routeURL:withParameters:handler:"></a>
### routeURL:withParameters:handler:

Routes a URL in any <a href="#//api/name/routes">routes</a> scheme, calling handler blocks (for patterns that match URL) until one returns YES.
Additional parameters get passed through to the matched route block.

`+ (BOOL)routeURL:(nullable NSURL *)*URL* withParameters:(nullable NSDictionary&lt;NSString*,id&gt; *)*parameters* handler:(nullable MLSRouteHandleTargetCallBackBlock)*handlerBlock*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/routesForScheme:" title="routesForScheme:"></a>
### routesForScheme:

Returns a routing namespace for the given scheme

`+ (instancetype)routesForScheme:(NSString *)*scheme*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/setAlwaysTreatsHostAsPathComponent:" title="setAlwaysTreatsHostAsPathComponent:"></a>
### setAlwaysTreatsHostAsPathComponent:

Configures if URL host is always considered to be a path component. Defaults to NO.

`+ (void)setAlwaysTreatsHostAsPathComponent:(BOOL)*treatsHostAsPathComponent*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/setShouldDecodePlusSymbols:" title="setShouldDecodePlusSymbols:"></a>
### setShouldDecodePlusSymbols:

Configures if &lsquo;+&rsquo; should be replaced with spaces in parsed values. Defaults to YES.

`+ (void)setShouldDecodePlusSymbols:(BOOL)*shouldDecode*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/setVerboseLoggingEnabled:" title="setVerboseLoggingEnabled:"></a>
### setVerboseLoggingEnabled:

Configures verbose logging. Defaults to NO.

`+ (void)setVerboseLoggingEnabled:(BOOL)*loggingEnabled*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/shouldDecodePlusSymbols" title="shouldDecodePlusSymbols"></a>
### shouldDecodePlusSymbols

Returns if &lsquo;+&rsquo; should be replaced with spaces in parsed values. Defaults to YES.

`+ (BOOL)shouldDecodePlusSymbols`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/unregisterAllRouteSchemes" title="unregisterAllRouteSchemes"></a>
### unregisterAllRouteSchemes

Unregister all <a href="#//api/name/routes">routes</a>

`+ (void)unregisterAllRouteSchemes`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/unregisterRouteScheme:" title="unregisterRouteScheme:"></a>
### unregisterRouteScheme:

Unregister and delete an entire scheme namespace

`+ (void)unregisterRouteScheme:(NSString *)*scheme*`

#### Declared In
* `MLSRoutes.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/addRoute:" title="addRoute:"></a>
### addRoute:

Add a route by directly inserted the route definition. This may be a subclass of <a href="../Classes/MLSRouteDefinition.html">MLSRouteDefinition</a> to provide customized routing logic.

`- (void)addRoute:(MLSRouteDefinition *)*routeDefinition*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/addRoute:handler:" title="addRoute:handler:"></a>
### addRoute:handler:

Registers a routePattern with default priority (0) in the receiving scheme namespace.

`- (void)addRoute:(NSString *)*routePattern* handler:(nullable MLSRouteHandlerParamsCallBackBlock)*handlerBlock*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/addRoute:handlerClass:" title="addRoute:handlerClass:"></a>
### addRoute:handlerClass:

Registers a routePattern with default priority (0) in the receiving scheme namespace.

`- (void)addRoute:(NSString *)*routePattern* handlerClass:(nullable Class)*handlerClass*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/addRoute:identifier:handlerClass:" title="addRoute:identifier:handlerClass:"></a>
### addRoute:identifier:handlerClass:

`- (void)addRoute:(NSString *)*routePattern* identifier:(nullable NSString *)*identifier* handlerClass:(nullable Class)*handlerClass*`

<a name="//api/name/addRoute:identifier:priority:handler:" title="addRoute:identifier:priority:handler:"></a>
### addRoute:identifier:priority:handler:

`- (void)addRoute:(NSString *)*routePattern* identifier:(nullable NSString *)*identifier* priority:(NSUInteger)*priority* handler:(nullable MLSRouteHandlerParamsCallBackBlock)*handlerBlock*`

<a name="//api/name/addRoute:identifier:priority:handlerClass:" title="addRoute:identifier:priority:handlerClass:"></a>
### addRoute:identifier:priority:handlerClass:

`- (void)addRoute:(NSString *)*routePattern* identifier:(nullable NSString *)*identifier* priority:(NSUInteger)*priority* handlerClass:(Class)*handlerClass*`

<a name="//api/name/addRoute:priority:handler:" title="addRoute:priority:handler:"></a>
### addRoute:priority:handler:

Registers a routePattern in the global scheme namespace with a handlerBlock to call when the route pattern is matched by a URL.
The block returns a BOOL representing if the handlerBlock actually handled the route or not. If
a block returns NO, MLSRoutes will continue trying to find a matching route.

`- (void)addRoute:(NSString *)*routePattern* priority:(NSUInteger)*priority* handler:(nullable MLSRouteHandlerParamsCallBackBlock)*handlerBlock*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/addRoute:priority:handlerClass:" title="addRoute:priority:handlerClass:"></a>
### addRoute:priority:handlerClass:

Registers a routePattern in the global scheme namespace with a handlerBlock to call when the route pattern is matched by a URL.
The block returns a BOOL representing if the handlerBlock actually handled the route or not. If
a block returns NO, MLSRoutes will continue trying to find a matching route.

`- (void)addRoute:(NSString *)*routePattern* priority:(NSUInteger)*priority* handlerClass:(nullable Class)*handlerClass*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/addRoutes:handler:" title="addRoutes:handler:"></a>
### addRoutes:handler:

Registers multiple routePatterns for one handler with default priority (0) in the receiving scheme namespace.

`- (void)addRoutes:(NSArray&lt;NSString*&gt; *)*routePatterns* handler:(nullable MLSRouteHandlerParamsCallBackBlock)*handlerBlock*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/addRoutes:handlerClass:" title="addRoutes:handlerClass:"></a>
### addRoutes:handlerClass:

Registers multiple routePatterns for one handler with default priority (0) in the receiving scheme namespace.

`- (void)addRoutes:(NSArray&lt;NSString*&gt; *)*routePatterns* handlerClass:(nullable Class)*handlerClass*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/canRouteURL:" title="canRouteURL:"></a>
### canRouteURL:

Returns YES if the provided URL will successfully match against any registered route for the current scheme, NO if not.

`- (BOOL)canRouteURL:(nullable NSURL *)*URL*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/removeAllRoutes" title="removeAllRoutes"></a>
### removeAllRoutes

Removes all <a href="#//api/name/routes">routes</a> from the receiving scheme namespace.

`- (void)removeAllRoutes`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/removeRoute:" title="removeRoute:"></a>
### removeRoute:

Removes a routePattern from the receiving scheme namespace.

`- (void)removeRoute:(NSString *)*routePattern*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/routeURL:handler:" title="routeURL:handler:"></a>
### routeURL:handler:

Routes a URL within a particular scheme, calling handler blocks for patterns that match the URL until one returns YES.
If no matching route is found, the <a href="#//api/name/unmatchedURLHandler">unmatchedURLHandler</a> will be called (if set).

`- (BOOL)routeURL:(nullable NSURL *)*URL* handler:(nullable MLSRouteHandleTargetCallBackBlock)*handlerBlock*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/routeURL:withParameters:handler:" title="routeURL:withParameters:handler:"></a>
### routeURL:withParameters:handler:

Routes a URL in a specific scheme, calling handler blocks (for patterns that match URL) until one returns YES.
Additional parameters get passed through to the matched route block.

`- (BOOL)routeURL:(nullable NSURL *)*URL* withParameters:(nullable NSDictionary&lt;NSString*,id&gt; *)*parameters* handler:(nullable MLSRouteHandleTargetCallBackBlock)*handlerBlock*`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/routes" title="routes"></a>
### routes

Return all registered routes in the receiving scheme namespace.

`- (NSArray&lt;MLSRouteDefinition*&gt; *)routes`

#### See Also

* `<a href="#//api/name/allRoutes">+ allRoutes</a>`

#### Declared In
* `MLSRoutes.h`

<a name="//api/name/setObject:forKeyedSubscript:" title="setObject:forKeyedSubscript:"></a>
### setObject:forKeyedSubscript:

Registers a routePattern with default priority (0) using dictionary-style subscripting.

`- (void)setObject:(nullable id)*obj* forKeyedSubscript:(NSString *)*routePatten*`

#### Declared In
* `MLSRoutes.h`

