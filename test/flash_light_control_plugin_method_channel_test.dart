import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flash_light_control_plugin/flash_light_control_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlashLightControlPlugin platform = MethodChannelFlashLightControlPlugin();
  const MethodChannel channel = MethodChannel('flash_light_control_plugin');

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

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
