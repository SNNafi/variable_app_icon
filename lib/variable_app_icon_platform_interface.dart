import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'variable_app_icon_method_channel.dart';

abstract class VariableAppIconPlatform extends PlatformInterface {
  /// Constructs a VariableAppIconPlatform.
  VariableAppIconPlatform() : super(token: _token);

  static final Object _token = Object();

  static VariableAppIconPlatform _instance = MethodChannelVariableAppIcon();

  /// The default instance of [VariableAppIconPlatform] to use.
  ///
  /// Defaults to [MethodChannelVariableAppIcon].
  static VariableAppIconPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VariableAppIconPlatform] when
  /// they register themselves.
  static set instance(VariableAppIconPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> changeAppIcon(String? iosIcon, String? androidIconId) {
    throw UnimplementedError('changeAppIcon() has not been implemented.');
  }
}
