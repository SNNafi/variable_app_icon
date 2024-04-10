import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:variable_app_icon/variable_app_icon_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelVariableAppIcon platform = MethodChannelVariableAppIcon();
  const MethodChannel channel = MethodChannel('variable_app_icon');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });
}
