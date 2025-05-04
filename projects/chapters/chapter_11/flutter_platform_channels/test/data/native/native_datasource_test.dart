import 'package:flutter/services.dart';
import 'package:flutter_platform_channels/data/native/channel.dart';
import 'package:flutter_platform_channels/data/native/native_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../di/di_test_utils.dart';

void main() {
  late NativeDataSource nativeDataSource;
  late MethodChannel mockMethodChannel;

  setUp(() {
    mockMethodChannel = MethodChannelMock();
    nativeDataSource = NativeDataSourceImpl(methodChannel: mockMethodChannel);
  });

  group('getTemperature()', () {
    group('happy scenarios', () {
      test(
          'Get the temperature from the method channel successfully with a positive value',
          () async {
        // Arrange
        const int expectedResult = 10;
        when(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
            .thenAnswer((_) async => expectedResult);

        // Act
        final result = await nativeDataSource.getTemperature();

        // Assert
        expect(result, expectedResult);
        verify(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
            .called(1);
        verifyNoMoreInteractions(mockMethodChannel);
      });

      test(
          'Get the temperature from the method channel successfully with a negative value',
          () async {
        // Arrange
        const int expectedResult = -10;
        when(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
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
        const int? response = null;
        const String expectedError = 'temp is missing';
        when(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
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
        verify(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
            .called(1);
        verifyNoMoreInteractions(mockMethodChannel);
      });

      test(
          'return data error when native fails to return temperature and it throws PlatformException',
          () async {
        // Arrange
        const String expectedError = 'temp is missing';

        // Act
        // Assert
        expect(
          () => nativeDataSource.getTemperature(),
          throwsA(
            isA<PlatformException>()
                .having((e) => e.message, 'message', expectedError),
          ),
        );
        verify(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
            .called(1);
        verifyNoMoreInteractions(mockMethodChannel);
      });

      test(
          'return data error when native fails to return temperature and it throws a default exception',
          () async {
        // Arrange
        const String expectedError = 'temp is missing';
        final mockException = MissingPluginException('Missing implementation');
        when(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
            .thenThrow(mockException);

        // Act
        // Assert
        expect(
          () => nativeDataSource.getTemperature(),
          throwsA(
            isA<PlatformException>().having((e) => e.message, 'message',
                expectedError // Asserting the message from the catch block
                ),
          ),
        );
        verify(() => mockMethodChannel.invokeMethod<int>(Channel.getTemp))
            .called(1);
        verifyNoMoreInteractions(mockMethodChannel);
      });
    });
  });
}
