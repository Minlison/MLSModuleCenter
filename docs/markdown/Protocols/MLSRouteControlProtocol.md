# MLSRouteControlProtocol Protocol Reference

&nbsp;&nbsp;**Conforms to** NSObject  
&nbsp;&nbsp;**Declared in** MLSRouteControlProtocol.h  

## Tasks

### 

[&nbsp;&nbsp;routeScheme](#//api/name/routeScheme) *property* *required method*

[&ndash;&nbsp;addRoute:scheme:handlerClass:](#//api/name/addRoute:scheme:handlerClass:)  *required method*

[&ndash;&nbsp;addRoute:handlerClass:](#//api/name/addRoute:handlerClass:)  *required method*

[&ndash;&nbsp;addRoute:scheme:handler:](#//api/name/addRoute:scheme:handler:)  *required method*

[&ndash;&nbsp;addRoute:handler:](#//api/name/addRoute:handler:)  *required method*

[&ndash;&nbsp;removeRoute:](#//api/name/removeRoute:)  *required method*

[&ndash;&nbsp;removeRoute:forScheme:](#//api/name/removeRoute:forScheme:)  *required method*

[&ndash;&nbsp;routeURL:](#//api/name/routeURL:)  *required method*

[&ndash;&nbsp;routeURL:withParameters:](#//api/name/routeURL:withParameters:)  *required method*

[&ndash;&nbsp;routeURL:handler:](#//api/name/routeURL:handler:)  *required method*

[&ndash;&nbsp;routeURL:withParameters:handler:](#//api/name/routeURL:withParameters:handler:)  *required method*

[&ndash;&nbsp;routeObjForURL:withParameters:](#//api/name/routeObjForURL:withParameters:)  *required method*

[&ndash;&nbsp;canHandleUrl:](#//api/name/canHandleUrl:)  *required method*

[&ndash;&nbsp;generateURLWithScheme:pattern:patternParamters:queryParameters:](#//api/name/generateURLWithScheme:pattern:patternParamters:queryParameters:)  *required method*

[&ndash;&nbsp;generateURLWithScheme:pattern:patternParamters:](#//api/name/generateURLWithScheme:pattern:patternParamters:)  *required method*

[&ndash;&nbsp;generateURLWithScheme:queryParameters:](#//api/name/generateURLWithScheme:queryParameters:)  *required method*

[&ndash;&nbsp;generateURLWithPattern:patternParamters:queryParameters:](#//api/name/generateURLWithPattern:patternParamters:queryParameters:)  *required method*

[&ndash;&nbsp;generateURLWithPattern:patternParamters:](#//api/name/generateURLWithPattern:patternParamters:)  *required method*

[&ndash;&nbsp;generateURLWithQueryParameters:](#//api/name/generateURLWithQueryParameters:)  *required method*

## Properties

<a name="//api/name/routeScheme" title="routeScheme"></a>
### routeScheme

配置路由协议， 可自定义配置， 默认 bundleID

`@property (nonatomic, copy) NSString *routeScheme`

#### Declared In
* `MLSRouteControlProtocol.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/addRoute:handler:" title="addRoute:handler:"></a>
### addRoute:handler:

`- (void)addRoute:(NSString *)*routePattern* handler:(nullable MLSRouteHandlerParamsCallBackBlock)*handlerBlock*`

<a name="//api/name/addRoute:handlerClass:" title="addRoute:handlerClass:"></a>
### addRoute:handlerClass:

`- (void)addRoute:(NSString *)*routePattern* handlerClass:(Class)*handlerClass*`

<a name="//api/name/addRoute:scheme:handler:" title="addRoute:scheme:handler:"></a>
### addRoute:scheme:handler:

注册路由

`- (void)addRoute:(NSString *)*routePattern* scheme:(nullable NSString *)*scheme* handler:(nullable MLSRouteHandlerParamsCallBackBlock)*handlerBlock*`

#### Parameters

*routePattern*  
&nbsp;&nbsp;&nbsp;路由地址  

*scheme*  
&nbsp;&nbsp;&nbsp;urlScheme， 默认是 innerApp  

*handlerBlock*  
&nbsp;&nbsp;&nbsp;回调  

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/addRoute:scheme:handlerClass:" title="addRoute:scheme:handlerClass:"></a>
### addRoute:scheme:handlerClass:

注册控制器

`- (void)addRoute:(NSString *)*routePattern* scheme:(nullable NSString *)*scheme* handlerClass:(Class)*handlerClass*`

#### Parameters

*routePattern*  
&nbsp;&nbsp;&nbsp;路由地址  

*scheme*  
&nbsp;&nbsp;&nbsp;urlScheme， 默认是 innerApp  

*handlerClass*  
&nbsp;&nbsp;&nbsp;接收路由的 Class  

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/canHandleUrl:" title="canHandleUrl:"></a>
### canHandleUrl:

是否可以打开该地址

`- (BOOL)canHandleUrl:(NSURL *)*routeUrl*`

#### Parameters

*routeUrl*  
&nbsp;&nbsp;&nbsp;路由地址  

#### Return Value
YES/NO

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/generateURLWithPattern:patternParamters:" title="generateURLWithPattern:patternParamters:"></a>
### generateURLWithPattern:patternParamters:

`- (NSURL *)generateURLWithPattern:(nullable NSString *)*pattern* patternParamters:(nullable NSArray *)*patternParamters*`

<a name="//api/name/generateURLWithPattern:patternParamters:queryParameters:" title="generateURLWithPattern:patternParamters:queryParameters:"></a>
### generateURLWithPattern:patternParamters:queryParameters:

`- (NSURL *)generateURLWithPattern:(nullable NSString *)*pattern* patternParamters:(nullable NSArray *)*patternParamters* queryParameters:(nullable NSDictionary *)*queryParameters*`

<a name="//api/name/generateURLWithQueryParameters:" title="generateURLWithQueryParameters:"></a>
### generateURLWithQueryParameters:

`- (NSURL *)generateURLWithQueryParameters:(nullable NSDictionary *)*queryParameters*`

<a name="//api/name/generateURLWithScheme:pattern:patternParamters:" title="generateURLWithScheme:pattern:patternParamters:"></a>
### generateURLWithScheme:pattern:patternParamters:

`- (NSURL *)generateURLWithScheme:(nullable NSString *)*scheme* pattern:(nullable NSString *)*pattern* patternParamters:(nullable NSArray *)*patternParamters*`

<a name="//api/name/generateURLWithScheme:pattern:patternParamters:queryParameters:" title="generateURLWithScheme:pattern:patternParamters:queryParameters:"></a>
### generateURLWithScheme:pattern:patternParamters:queryParameters:

调用此方法来拼接 urlpattern 和 parameters

`- (NSURL *)generateURLWithScheme:(nullable NSString *)*scheme* pattern:(nullable NSString *)*pattern* patternParamters:(nullable NSArray *)*patternParamters* queryParameters:(nullable NSDictionary *)*queryParameters*`

#### Parameters

*scheme*  
&nbsp;&nbsp;&nbsp;UrlScheme 默认 <a href="#//api/name/routeScheme">routeScheme</a>  

*pattern*  
&nbsp;&nbsp;&nbsp;url pattern 比如 @&ldquo;beauty/:id&rdquo;  

*patternParamters*  
&nbsp;&nbsp;&nbsp;一个数组，数量要跟 pattern 里的变量一致  

*queryParameters*  
&nbsp;&nbsp;&nbsp;一个字典，query取值  

#### Return Value
返回生成的URL String

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/generateURLWithScheme:queryParameters:" title="generateURLWithScheme:queryParameters:"></a>
### generateURLWithScheme:queryParameters:

`- (NSURL *)generateURLWithScheme:(nullable NSString *)*scheme* queryParameters:(nullable NSDictionary *)*queryParameters*`

<a name="//api/name/removeRoute:" title="removeRoute:"></a>
### removeRoute:

移除注册路由

`- (void)removeRoute:(nullable NSString *)*routePattern*`

#### Parameters

*routePattern*  
&nbsp;&nbsp;&nbsp;路由正则  

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/removeRoute:forScheme:" title="removeRoute:forScheme:"></a>
### removeRoute:forScheme:

`- (void)removeRoute:(nullable NSString *)*routePattern* forScheme:(nullable NSString *)*scheme*`

<a name="//api/name/routeObjForURL:withParameters:" title="routeObjForURL:withParameters:"></a>
### routeObjForURL:withParameters:

获取路由结果对象

`- (id)routeObjForURL:(NSURL *)*routeURL* withParameters:(nullable NSDictionary *)*parameters*`

#### Parameters

*routeURL*  
&nbsp;&nbsp;&nbsp;路由地址  

*parameters*  
&nbsp;&nbsp;&nbsp;路由参数  

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/routeURL:" title="routeURL:"></a>
### routeURL:

打开路由地址
也可调用 [[UIApplication sharedApplication] openURL:url];

`- (BOOL)routeURL:(NSURL *)*routeURL*`

#### Parameters

*routeURL*  
&nbsp;&nbsp;&nbsp;路由地址  

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/routeURL:handler:" title="routeURL:handler:"></a>
### routeURL:handler:

打开路由地址

`- (BOOL)routeURL:(NSURL *)*routeURL* handler:(nullable MLSRouteHandleTargetCallBackBlock)*handlerBlock*`

#### Parameters

*routeURL*  
&nbsp;&nbsp;&nbsp;路由地址  

*handlerBlock*  
&nbsp;&nbsp;&nbsp;回调函数  

#### Return Value
是否打开成功

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/routeURL:withParameters:" title="routeURL:withParameters:"></a>
### routeURL:withParameters:

打开路由地址

`- (BOOL)routeURL:(NSURL *)*routeURL* withParameters:(nullable NSDictionary *)*paramters*`

#### Parameters

*routeURL*  
&nbsp;&nbsp;&nbsp;路由地址  

*paramters*  
&nbsp;&nbsp;&nbsp;附加参数, 最终会回调给 handleObj  

#### Declared In
* `MLSRouteControlProtocol.h`

<a name="//api/name/routeURL:withParameters:handler:" title="routeURL:withParameters:handler:"></a>
### routeURL:withParameters:handler:

打开路由地址

`- (BOOL)routeURL:(NSURL *)*routeURL* withParameters:(nullable NSDictionary *)*parameters* handler:(nullable MLSRouteHandleTargetCallBackBlock)*handlerBlock*`

#### Parameters

*routeURL*  
&nbsp;&nbsp;&nbsp;路由地址  

*parameters*  
&nbsp;&nbsp;&nbsp;回调函数  

*handlerBlock*  
&nbsp;&nbsp;&nbsp;是否打开成功  

#### Declared In
* `MLSRouteControlProtocol.h`

