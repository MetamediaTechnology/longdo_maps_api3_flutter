#import "LongdoMapsApi3FlutterPlugin.h"
#if __has_include(<longdo_maps_api3_flutter/longdo_maps_api3_flutter-Swift.h>)
#import <longdo_maps_api3_flutter/longdo_maps_api3_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "longdo_maps_api3_flutter-Swift.h"
#endif

@implementation LongdoMapsApi3FlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLongdoMapsApi3FlutterPlugin registerWithRegistrar:registrar];
}
@end
