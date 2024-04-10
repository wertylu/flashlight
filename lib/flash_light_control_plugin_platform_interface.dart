import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flash_light_control_plugin_method_channel.dart';

abstract class FlashLightControlPluginPlatform extends PlatformInterface {
  /// Constructs a FlashLightControlPluginPlatform.
  FlashLightControlPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlashLightControlPluginPlatform _instance = MethodChannelFlashLightControlPlugin();

  /// The default instance of [FlashLightControlPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlashLightControlPlugin].
  static FlashLightControlPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlashLightControlPluginPlatform] when
  /// they register themselves.
  static set instance(FlashLightControlPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
