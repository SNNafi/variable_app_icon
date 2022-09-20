#import "VariableAppIconPlugin.h"

@implementation VariableAppIconPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"variable_app_icon"
            binaryMessenger:[registrar messenger]];
  VariableAppIconPlugin* instance = [[VariableAppIconPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"changeAppIcon" isEqualToString:call.method]) {
      NSString *iconName = (NSString*) call.arguments[@"iosIcon"];
      NSString *defaultiOSIcon = (NSString*) call.arguments[@"defaultiOS"];
      [UIApplication.sharedApplication setAlternateIconName:[iconName isEqualToString:defaultiOSIcon] ? nil : iconName completionHandler:nil];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
