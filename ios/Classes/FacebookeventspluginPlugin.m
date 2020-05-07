#import "FacebookeventspluginPlugin.h"
#if __has_include(<facebookeventsplugin/facebookeventsplugin-Swift.h>)
#import <facebookeventsplugin/facebookeventsplugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "facebookeventsplugin-Swift.h"

#endif

@implementation FacebookeventspluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFacebookeventspluginPlugin registerWithRegistrar:registrar];
}
@end
