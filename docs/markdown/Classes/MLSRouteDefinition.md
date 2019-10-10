# MLSRouteDefinition Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** MLSRouteDefinition.h  

## Overview

MLSRouteDefinition is a model object representing a registered route, including the URL <a href="#//api/name/scheme">scheme</a>, route <a href="#//api/name/pattern">pattern</a>, and <a href="#//api/name/priority">priority</a>.

This class can be subclassed to customize route parsing behavior by overriding <a href="#//api/name/routeResponseForRequest:decodePlusSymbols:">routeResponseForRequest:decodePlusSymbols:</a>.
-callHandlerBlockWithParameters can also be overriden to customize the parameters passed to the <a href="#//api/name/handlerBlock">handlerBlock</a>.

## Tasks

### Other Methods

[&nbsp;&nbsp;scheme](#//api/name/scheme) *property* 

[&nbsp;&nbsp;identifier](#//api/name/identifier) *property* 

[&nbsp;&nbsp;pattern](#//api/name/pattern) *property* 

[&nbsp;&nbsp;priority](#//api/name/priority) *property* 

[&nbsp;&nbsp;handlerBlock](#//api/name/handlerBlock) *property* 

[&nbsp;&nbsp;handlerVCBlock](#//api/name/handlerVCBlock) *property* 

[&nbsp;&nbsp;targetControllerClass](#//api/name/targetControllerClass) *property* 

[&nbsp;&nbsp;targetViewController](#//api/name/targetViewController) *property* 

### Creating Route Definitions

[&ndash;&nbsp;initWithScheme:pattern:priority:handlerBlock:](#//api/name/initWithScheme:pattern:priority:handlerBlock:)  

[&ndash;&nbsp;initWithScheme:pattern:priority:handlerClass:](#//api/name/initWithScheme:pattern:priority:handlerClass:)  

[&ndash;&nbsp;init](#//api/name/init)  

[+&nbsp;new](#//api/name/new)  

### Matching Route Requests

[&ndash;&nbsp;routeResponseForRequest:decodePlusSymbols:](#//api/name/routeResponseForRequest:decodePlusSymbols:)  

[&ndash;&nbsp;callHandlerBlockWithParameters:](#//api/name/callHandlerBlockWithParameters:)  

[&ndash;&nbsp;canCallHandlerBlockWithParameters:](#//api/name/canCallHandlerBlockWithParameters:)  

[&ndash;&nbsp;callControllerHandlerBlockWithParameters:](#//api/name/callControllerHandlerBlockWithParameters:)  

## Properties

<a name="//api/name/handlerBlock" title="handlerBlock"></a>
### handlerBlock

The handler block to invoke when a match is found.

`@property (nonatomic, copy, readonly) MLSRouteHandlerParamsCallBackBlock handlerBlock`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/handlerVCBlock" title="handlerVCBlock"></a>
### handlerVCBlock

The handler block to invoke when a match is found.

`@property (nonatomic, copy, nullable) BOOL ( ^ ) ( UIViewController&lt;MLSRouteDefinitionTargetController&gt; *targetVC ) handlerVCBlock`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/identifier" title="identifier"></a>
### identifier

标识符

`@property (nonatomic, copy) NSString *identifier`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/pattern" title="pattern"></a>
### pattern

The route pattern.

`@property (nonatomic, copy, readonly) NSString *pattern`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/priority" title="priority"></a>
### priority

The priority of this route <a href="#//api/name/pattern">pattern</a>.

`@property (nonatomic, assign, readonly) NSUInteger priority`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/scheme" title="scheme"></a>
### scheme

The URL scheme for which this route applies, or MLSRoutesGlobalRoutesScheme if global.

`@property (nonatomic, copy, readonly) NSString *scheme`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/targetControllerClass" title="targetControllerClass"></a>
### targetControllerClass

目标控制器类
遵守 <a href="../Protocols/MLSRouteDefinitionTargetController.html">MLSRouteDefinitionTargetController</a> 协议

`@property (strong, nonatomic) Class targetControllerClass`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/targetViewController" title="targetViewController"></a>
### targetViewController

`@property (strong, nonatomic, nullable) UIViewController&lt;MLSRouteDefinitionTargetController&gt; *targetViewController`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/new" title="new"></a>
### new

Unavailable, use <a href="#//api/name/initWithScheme:pattern:priority:handlerBlock:">initWithScheme:pattern:priority:handlerBlock:</a> instead.

`+ (instancetype)new`

#### Declared In
* `MLSRouteDefinition.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/callControllerHandlerBlockWithParameters:" title="callControllerHandlerBlockWithParameters:"></a>
### callControllerHandlerBlockWithParameters:

`- (BOOL)callControllerHandlerBlockWithParameters:(NSDictionary *)*parameters*`

<a name="//api/name/callHandlerBlockWithParameters:" title="callHandlerBlockWithParameters:"></a>
### callHandlerBlockWithParameters:

Invoke <a href="#//api/name/handlerBlock">handlerBlock</a> with the given parameters. This may be overriden by subclasses.

`- (id)callHandlerBlockWithParameters:(NSDictionary *)*parameters*`

#### Parameters

*parameters*  
&nbsp;&nbsp;&nbsp;The parameters to pass to <a href="#//api/name/handlerBlock">handlerBlock</a>.  

#### Return Value
The value returned by calling <a href="#//api/name/handlerBlock">handlerBlock</a> (YES if it is considered handled and NO if not).

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/canCallHandlerBlockWithParameters:" title="canCallHandlerBlockWithParameters:"></a>
### canCallHandlerBlockWithParameters:

`- (BOOL)canCallHandlerBlockWithParameters:(NSMutableDictionary *)*parameters*`

<a name="//api/name/init" title="init"></a>
### init

Unavailable, use <a href="#//api/name/initWithScheme:pattern:priority:handlerBlock:">initWithScheme:pattern:priority:handlerBlock:</a> instead.

`- (instancetype)init`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/initWithScheme:pattern:priority:handlerBlock:" title="initWithScheme:pattern:priority:handlerBlock:"></a>
### initWithScheme:pattern:priority:handlerBlock:

Creates a <a href="#//api/name/new">new</a> route definition. The created definition can be directly added to an instance of <a href="../Classes/MLSRoutes.html">MLSRoutes</a>.

`- (instancetype)initWithScheme:(NSString *)*scheme* pattern:(NSString *)*pattern* priority:(NSUInteger)*priority* handlerBlock:(nullable MLSRouteHandlerParamsCallBackBlock)*handlerBlock*`

#### Parameters

*scheme*  
&nbsp;&nbsp;&nbsp;The URL <a href="#//api/name/scheme">scheme</a> this route applies for, or MLSRoutesGlobalRoutesScheme if global.  

*pattern*  
&nbsp;&nbsp;&nbsp;The full route <a href="#//api/name/pattern">pattern</a> (&lsquo;/foo/:bar&rsquo;)  

*priority*  
&nbsp;&nbsp;&nbsp;The route <a href="#//api/name/priority">priority</a>, or 0 if default.  

*handlerBlock*  
&nbsp;&nbsp;&nbsp;The handler block to call when a successful match is found.  

#### Return Value
The newly initialized route definition.

#### Discussion
This is the designated initializer.

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/initWithScheme:pattern:priority:handlerClass:" title="initWithScheme:pattern:priority:handlerClass:"></a>
### initWithScheme:pattern:priority:handlerClass:

控制器 handler

`- (instancetype)initWithScheme:(NSString *)*scheme* pattern:(NSString *)*pattern* priority:(NSUInteger)*priority* handlerClass:(Class)*handlerClass*`

#### Declared In
* `MLSRouteDefinition.h`

<a name="//api/name/routeResponseForRequest:decodePlusSymbols:" title="routeResponseForRequest:decodePlusSymbols:"></a>
### routeResponseForRequest:decodePlusSymbols:

Creates and returns a <a href="../Classes/MLSRouteResponse.html">MLSRouteResponse</a> for the provided <a href="../Classes/MLSRouteRequest.html">MLSRouteRequest</a>. The response specifies if there was a match or not.

`- (MLSRouteResponse *)routeResponseForRequest:(MLSRouteRequest *)*request* decodePlusSymbols:(BOOL)*decodePlusSymbols*`

#### Parameters

*request*  
&nbsp;&nbsp;&nbsp;The <a href="../Classes/MLSRouteRequest.html">MLSRouteRequest</a> to create a response for.  

*decodePlusSymbols*  
&nbsp;&nbsp;&nbsp;The global plus symbol decoding option value.  

#### Return Value
An <a href="../Classes/MLSRouteResponse.html">MLSRouteResponse</a> instance representing the result of attempting to match request to thie route definition.

#### Declared In
* `MLSRouteDefinition.h`

