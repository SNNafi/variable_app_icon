import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:variable_app_icon/variable_app_icon_method_channel.dart';

void main() {
  MethodChannelVariableAppIcon platform = MethodChannelVariableAppIcon();
  const MethodChannel channel = MethodChannel('variable_app_icon');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
