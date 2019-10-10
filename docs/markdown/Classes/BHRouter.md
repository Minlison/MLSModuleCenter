# BHRouter Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** BHRouter.h  

## Tasks

### 

[&ndash;&nbsp;init](#//api/name/init)  

[+&nbsp;new](#//api/name/new)  

[+&nbsp;globalRouter](#//api/name/globalRouter)  

[+&nbsp;routerForScheme:](#//api/name/routerForScheme:)  

[+&nbsp;unRegisterRouterForScheme:](#//api/name/unRegisterRouterForScheme:)  

[+&nbsp;unRegisterAllRouters](#//api/name/unRegisterAllRouters)  

[&ndash;&nbsp;addPathComponent:forClass:](#//api/name/addPathComponent:forClass:)  

[&ndash;&nbsp;addPathComponent:forClass:handler:](#//api/name/addPathComponent:forClass:handler:)  

[&ndash;&nbsp;removePathComponent:](#//api/name/removePathComponent:)  

[+&nbsp;canOpenURL:](#//api/name/canOpenURL:)  

[+&nbsp;openURL:](#//api/name/openURL:)  

[+&nbsp;openURL:withParams:](#//api/name/openURL:withParams:)  

[+&nbsp;openURL:withParams:andThen:](#//api/name/openURL:withParams:andThen:)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/canOpenURL:" title="canOpenURL:"></a>
### canOpenURL:

`+ (BOOL)canOpenURL:(NSURL *)*URL*`

<a name="//api/name/globalRouter" title="globalRouter"></a>
### globalRouter

`+ (instancetype)globalRouter`

<a name="//api/name/new" title="new"></a>
### new

`+ (instancetype)new`

<a name="//api/name/openURL:" title="openURL:"></a>
### openURL:

`+ (BOOL)openURL:(NSURL *)*URL*`

<a name="//api/name/openURL:withParams:" title="openURL:withParams:"></a>
### openURL:withParams:

`+ (BOOL)openURL:(NSURL *)*URL* withParams:(NSDictionary&lt;NSString*,NSDictionary&lt;NSString*,id&gt; *&gt; *)*params*`

<a name="//api/name/openURL:withParams:andThen:" title="openURL:withParams:andThen:"></a>
### openURL:withParams:andThen:

`+ (BOOL)openURL:(NSURL *)*URL* withParams:(NSDictionary&lt;NSString*,NSDictionary&lt;NSString*,id&gt; *&gt; *)*params* andThen:(void ( ^ ) ( NSString *pathComponentKey , id obj , id returnValue ))*then*`

<a name="//api/name/routerForScheme:" title="routerForScheme:"></a>
### routerForScheme:

`+ (instancetype)routerForScheme:(NSString *)*scheme*`

<a name="//api/name/unRegisterAllRouters" title="unRegisterAllRouters"></a>
### unRegisterAllRouters

`+ (void)unRegisterAllRouters`

<a name="//api/name/unRegisterRouterForScheme:" title="unRegisterRouterForScheme:"></a>
### unRegisterRouterForScheme:

`+ (void)unRegisterRouterForScheme:(NSString *)*scheme*`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/addPathComponent:forClass:" title="addPathComponent:forClass:"></a>
### addPathComponent:forClass:

`- (void)addPathComponent:(NSString *)*pathComponentKey* forClass:(Class)*mClass*`

<a name="//api/name/addPathComponent:forClass:handler:" title="addPathComponent:forClass:handler:"></a>
### addPathComponent:forClass:handler:

`- (void)addPathComponent:(NSString *)*pathComponentKey* forClass:(Class)*mClass* handler:(BHRPathComponentCustomHandler)*handler*`

<a name="//api/name/init" title="init"></a>
### init

`- (instancetype)init`

<a name="//api/name/removePathComponent:" title="removePathComponent:"></a>
### removePathComponent:

`- (void)removePathComponent:(NSString *)*pathComponentKey*`

