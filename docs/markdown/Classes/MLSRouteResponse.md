# MLSRouteResponse Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** MLSRouteResponse.h  

## Overview

MLSRouteResponse is the response from attempting to route a <a href="../Classes/MLSRouteRequest.html">MLSRouteRequest</a>.

## Tasks

### Other Methods

[&nbsp;&nbsp;match](#//api/name/match) *property* 

[&nbsp;&nbsp;parameters](#//api/name/parameters) *property* 

### Creating Responses

[+&nbsp;invalidMatchResponse](#//api/name/invalidMatchResponse)  

[+&nbsp;validMatchResponseWithParameters:](#//api/name/validMatchResponseWithParameters:)  

[&ndash;&nbsp;init](#//api/name/init)  

[+&nbsp;new](#//api/name/new)  

## Properties

<a name="//api/name/match" title="match"></a>
### match

Indicates if the response is a match or not.

`@property (nonatomic, assign, readonly, getter=isMatch) BOOL match`

#### Declared In
* `MLSRouteResponse.h`

<a name="//api/name/parameters" title="parameters"></a>
### parameters

The <a href="#//api/name/match">match</a> parameters (or nil for an invalid response).

`@property (nonatomic, strong, readonly, nullable) NSDictionary *parameters`

#### Declared In
* `MLSRouteResponse.h`

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/invalidMatchResponse" title="invalidMatchResponse"></a>
### invalidMatchResponse

Creates an invalid <a href="#//api/name/match">match</a> response.

`+ (instancetype)invalidMatchResponse`

#### Declared In
* `MLSRouteResponse.h`

<a name="//api/name/new" title="new"></a>
### new

Unavailable, please use <a href="#//api/name/invalidMatchResponse">invalidMatchResponse</a> or <a href="#//api/name/validMatchResponseWithParameters:">validMatchResponseWithParameters:</a> instead.

`+ (instancetype)new`

#### Declared In
* `MLSRouteResponse.h`

<a name="//api/name/validMatchResponseWithParameters:" title="validMatchResponseWithParameters:"></a>
### validMatchResponseWithParameters:

Creates a valid <a href="#//api/name/match">match</a> response with the given <a href="#//api/name/parameters">parameters</a>.

`+ (instancetype)validMatchResponseWithParameters:(NSDictionary *)*parameters*`

#### Declared In
* `MLSRouteResponse.h`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/init" title="init"></a>
### init

Unavailable, please use <a href="#//api/name/invalidMatchResponse">invalidMatchResponse</a> or <a href="#//api/name/validMatchResponseWithParameters:">validMatchResponseWithParameters:</a> instead.

`- (instancetype)init`

#### Declared In
* `MLSRouteResponse.h`

