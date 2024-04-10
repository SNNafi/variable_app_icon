import 'package:flutter_test/flutter_test.dart';
import 'package:variable_app_icon/variable_app_icon.dart';
import 'package:variable_app_icon/variable_app_icon_platform_interface.dart';
import 'package:variable_app_icon/variable_app_icon_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVariableAppIconPlatform
    with MockPlatformInterfaceMixin
    implements VariableAppIconPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> changeAppIcon(String? iosIcon, String? androidIconId) {
    throw Future.value('Success');
  }
}

void main() {
  final VariableAppIconPlatform initialPlatform = VariableAppIconPlatform.instance;

  test('$MethodChannelVariableAppIcon is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVariableAppIcon>());
  });
}
