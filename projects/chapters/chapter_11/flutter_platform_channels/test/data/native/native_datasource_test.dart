import 'package:flutter/services.dart';
import 'package:flutter_platform_channels/data/native/channel.dart';
import 'package:flutter_platform_channels/data/native/native_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/di_test_utils.dart';

void main() {
  NativeDataSource nativeDataSource;
  MethodChannel methodChannel;

  setUp(() {
    methodChannel = MethodChannelMock();
    nativeDataSource = NativeDataSourceImpl(methodChannel: methodChannel);
  });

  group('getTemperature()', () {
    group('happy scenarios', () {
      test(
          'Get the temperature from the method channel successfully with a positive value',
          () async {
        // Arrange
        const int expectedResult = 10;
        when(methodChannel.invokeMethod(Channel.getTemp))
            .thenAnswer((_) async => expectedResult);

        // Act
        final result = await nativeDataSource.getTemperature();

        // Assert
        expect(result, expectedResult);
      });

      test(
          'Get the temperature from the method channel successfully with a negative value',
          () async {
        // Arrange
        const int expectedResult = -10;
        when(methodChannel.invokeMethod(Channel.getTemp))
            .thenAnswer((_) async => expectedResult);

        // Act
        final result = await nativeDataSource.getTemperature();

        // Assert
        expect(result, expectedResult);
      });
    });

    group('error scenarios', () {
      test(
          'return data error when native fails to return temperature and it returns with null',
          () async {
        // Arrange
        const int response = null;
        const String expectedError = 'temp is missing';
        when(methodChannel.invokeMethod(Channel.getTemp))
            .thenAnswer((_) async => response);

        // Act
        // Assert
        expect(
          () => nativeDataSource.getTemperature(),
          throwsA(
            predicate(
                (e) => e is PlatformException && e.message == expectedError),
          ),
        );
      });

      test(
          'return data error when native fails to return temperature and it throws PlatformException',
          () async {
        // Arrange
        const String expectedError = 'temp is missing';
        when(methodChannel.invokeMethod(Channel.getTemp))
            .thenThrow(PlatformException(message: expectedError, code: ""));

        // Act
        // Assert
        expect(
          () => nativeDataSource.getTemperature(),
          throwsA(
            predicate(
                (e) => e is PlatformException && e.message == expectedError),
          ),
        );
      });

      test(
          'return data error when native fails to return temperature and it throws a default exception',
          () async {
        // Arrange
        const String expectedError = 'temp is missing';
        when(methodChannel.invokeMethod(Channel.getTemp))
            .thenThrow(MissingPluginException());

        // Act
        // Assert
        expect(
          () => nativeDataSource.getTemperature(),
          throwsA(
            predicate(
                (e) => e is PlatformException && e.message == expectedError),
          ),
        );
      });
    });
  });
}
