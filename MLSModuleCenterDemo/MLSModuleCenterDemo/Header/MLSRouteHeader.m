// MLS Auto Create 
// Not Modify 
// Date: 2019-12-06 05:35:34 +0000

#import "MLSRouteHeader.h"



@implementation NSURL (MLSTestDefaultViewController_Routes)

+ (NSURL *)URLForRouteTestDefault {
      NSString *routeString = [NSString stringWithFormat:@"com.minlison.module://test/default"];
       routeString = [routeString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
       return [NSURL URLWithString:routeString];
}
@end

@implementation NSURL (MLSTestPathParamsViewController_Routes)

+ (NSURL *)URLForRouteTestPathDefaultType:(NSString *)type  {
      NSString *routeString = [NSString stringWithFormat:@"com.minlison.module://testPath/default/%@",type];
       routeString = [routeString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
       return [NSURL URLWithString:routeString];
}
@end

@implementation NSURL (MLSTestSchemeViewController_Routes)

+ (NSURL *)URLForRouteTestPathScheme {
      NSString *routeString = [NSString stringWithFormat:@"mls_custom_scheme://testPath/scheme"];
       routeString = [routeString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
       return [NSURL URLWithString:routeString];
}
@end

