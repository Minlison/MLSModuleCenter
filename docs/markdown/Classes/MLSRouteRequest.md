# MLSRouteRequest Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** MLSRouteRequest.h  

## Overview

MLSRouteRequest is a model representing a request to route a <a href="#//api/name/URL">URL</a>.
It gets parsed into path components and query parameters, which are then used by <a href="../Classes/MLSRouteDefinition.html">MLSRouteDefinition</a> to attempt a match.

## Tasks

### Other Methods

[&nbsp;&nbsp;URL](#//api/name/URL) *property* 

[&nbsp;&nbsp;pathComponents](#//api/name/pathComponents) *property* 

[&nbsp;&nbsp;queryParams](#//api/name/queryParams) *property* 

### Creating Route Requests

[&ndash;&nbsp;initWithURL:alwaysTreatsHostAsPathComponent:](#//api/name/initWithURL:alwaysTreatsHostAsPathComponent:)  

[&ndash;&nbsp;init](#//api/name/init)  

[+&nbsp;new](#//api/name/new)  

## Properties

<a name="//api/name/URL" title="URL"></a>
### URL

The URL being routed.

`@property (nonatomic, strong, readonly) NSURL *URL`

#### Declared In
* `MLSRouteRequest.h`

<a name="//api/name/pathComponents" title="pathComponents"></a>
### pathComponents

The URL&rsquo;s path components.

`@property (nonatomic, strong, readonly) NSArray *pathComponents`

#### Declared In
* `MLSRouteRequest.h`

<a name="//api/name/queryParams" title="queryParams"></a>
### queryParams

The URL&rsquo;s query parameters.

`@property (nonatomic, strong, readonly) NSDictionary *queryParams`

#### Declared In
* `MLSRouteRequest.h`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/new" title="new"></a>
### new

Unavailable, use <a href="#//api/name/initWithURL:alwaysTreatsHostAsPathComponent:">initWithURL:alwaysTreatsHostAsPathComponent:</a> instead.

`+ (instancetype)new`

#### Declared In
* `MLSRouteRequest.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/init" title="init"></a>
### init

Unavailable, use <a href="#//api/name/initWithURL:alwaysTreatsHostAsPathComponent:">initWithURL:alwaysTreatsHostAsPathComponent:</a> instead.

`- (instancetype)init`

#### Declared In
* `MLSRouteRequest.h`

<a name="//api/name/initWithURL:alwaysTreatsHostAsPathComponent:" title="initWithURL:alwaysTreatsHostAsPathComponent:"></a>
### initWithURL:alwaysTreatsHostAsPathComponent:

Creates a <a href="#//api/name/new">new</a> route request.

`- (instancetype)initWithURL:(NSURL *)*URL* alwaysTreatsHostAsPathComponent:(BOOL)*alwaysTreatsHostAsPathComponent*`

#### Parameters

*URL*  
&nbsp;&nbsp;&nbsp;The <a href="#//api/name/URL">URL</a> to route.  

*alwaysTreatsHostAsPathComponent*  
&nbsp;&nbsp;&nbsp;The global option for if to treat the <a href="#//api/name/URL">URL</a> host as a path component or not.  

#### Return Value
The newly initialized route request.

#### Declared In
* `MLSRouteRequest.h`

