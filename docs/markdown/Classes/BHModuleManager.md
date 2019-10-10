# BHModuleManager Class Reference

&nbsp;&nbsp;**Inherits from** NSObject  
&nbsp;&nbsp;**Declared in** BHModuleManager.h  

## Tasks

### 

[+&nbsp;sharedManager](#//api/name/sharedManager)  

[&ndash;&nbsp;registerDynamicModule:](#//api/name/registerDynamicModule:)  

[&ndash;&nbsp;registerDynamicModule:shouldTriggerInitEvent:](#//api/name/registerDynamicModule:shouldTriggerInitEvent:)  

[&ndash;&nbsp;unRegisterDynamicModule:](#//api/name/unRegisterDynamicModule:)  

[&ndash;&nbsp;loadLocalModules](#//api/name/loadLocalModules)  

[&ndash;&nbsp;registedAllModules](#//api/name/registedAllModules)  

[&ndash;&nbsp;registerCustomEvent:withModuleInstance:andSelectorStr:](#//api/name/registerCustomEvent:withModuleInstance:andSelectorStr:)  

[&ndash;&nbsp;triggerEvent:](#//api/name/triggerEvent:)  

[&ndash;&nbsp;triggerEvent:withCustomParam:](#//api/name/triggerEvent:withCustomParam:)  

<a title="Class Methods" name="class_methods"></a>
## Class Methods

<a name="//api/name/sharedManager" title="sharedManager"></a>
### sharedManager

`+ (instancetype)sharedManager`

<a title="Instance Methods" name="instance_methods"></a>
## Instance Methods

<a name="//api/name/loadLocalModules" title="loadLocalModules"></a>
### loadLocalModules

`- (void)loadLocalModules`

<a name="//api/name/registedAllModules" title="registedAllModules"></a>
### registedAllModules

`- (void)registedAllModules`

<a name="//api/name/registerCustomEvent:withModuleInstance:andSelectorStr:" title="registerCustomEvent:withModuleInstance:andSelectorStr:"></a>
### registerCustomEvent:withModuleInstance:andSelectorStr:

`- (void)registerCustomEvent:(NSInteger)*eventType* withModuleInstance:(id)*moduleInstance* andSelectorStr:(NSString *)*selectorStr*`

<a name="//api/name/registerDynamicModule:" title="registerDynamicModule:"></a>
### registerDynamicModule:

`- (void)registerDynamicModule:(Class)*moduleClass*`

<a name="//api/name/registerDynamicModule:shouldTriggerInitEvent:" title="registerDynamicModule:shouldTriggerInitEvent:"></a>
### registerDynamicModule:shouldTriggerInitEvent:

`- (void)registerDynamicModule:(Class)*moduleClass* shouldTriggerInitEvent:(BOOL)*shouldTriggerInitEvent*`

<a name="//api/name/triggerEvent:" title="triggerEvent:"></a>
### triggerEvent:

`- (void)triggerEvent:(NSInteger)*eventType*`

<a name="//api/name/triggerEvent:withCustomParam:" title="triggerEvent:withCustomParam:"></a>
### triggerEvent:withCustomParam:

`- (void)triggerEvent:(NSInteger)*eventType* withCustomParam:(NSDictionary *)*customParam*`

<a name="//api/name/unRegisterDynamicModule:" title="unRegisterDynamicModule:"></a>
### unRegisterDynamicModule:

`- (void)unRegisterDynamicModule:(Class)*moduleClass*`

