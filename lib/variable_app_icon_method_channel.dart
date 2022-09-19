import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'variable_app_icon_platform_interface.dart';

/// An implementation of [VariableAppIconPlatform] that uses method channels.
class MethodChannelVariableAppIcon extends VariableAppIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('variable_app_icon');

  @override
  Future<String?> changeAppIcon(String? name) async {
    final version = await methodChannel.invokeMethod<String>('changeAppIcon', {"name": name});
    return version;
  }
}
