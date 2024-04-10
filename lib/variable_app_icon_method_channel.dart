import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'variable_app_icon.dart';
import 'variable_app_icon_platform_interface.dart';

/// An implementation of [VariableAppIconPlatform] that uses method channels.
class MethodChannelVariableAppIcon extends VariableAppIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('variable_app_icon');

  @override
  Future<String?> changeAppIcon(String? iosIcon, String? androidIconId) async {
    final version = await methodChannel.invokeMethod<String>('changeAppIcon', {
      "iosIcon": iosIcon,
      "androidIconId": androidIconId,
      "defaultiOS": VariableAppIcon.iOSDefaultAppIcon,
      "androidIcons": VariableAppIcon.androidAppIconIds
    });
    return version;
  }
}

