import 'package:flutter/foundation.dart';
import 'package:flutter_platform_channels/data/native/native_datasource.dart';

abstract class Repository {
  Future<int> getTemperature();
}

class RepositoryImpl extends Repository {
  final NativeDataSource nativeDataSource;

  RepositoryImpl({
    @required this.nativeDataSource,
  });

  @override
  Future<int> getTemperature() async {
    var currentTemp;
    try {
      currentTemp = await nativeDataSource.getTemperature();
    } catch (e) {
      currentTemp = 0;
    }
    return currentTemp;
  }
}
