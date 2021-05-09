import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_channels/data/native/channel.dart';

abstract class NativeDataSource {
  Future<int> getTemperature();
}

class NativeDataSourceImpl extends NativeDataSource {
  final MethodChannel methodChannel;

  NativeDataSourceImpl({@required this.methodChannel});

  @override
  Future<int> getTemperature() async {
    try {
      final int currentTemp = await methodChannel.invokeMethod(Channel.getTemp);
      if (currentTemp == null) {
        throw PlatformException(message: 'temp is missing', code: "");
      }
      return currentTemp;
    } catch (e) {
      throw PlatformException(message: 'temp is missing', code: "");
    }
  }
}
