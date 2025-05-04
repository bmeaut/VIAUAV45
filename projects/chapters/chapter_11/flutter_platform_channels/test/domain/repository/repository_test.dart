import 'package:flutter/services.dart';
import 'package:flutter_platform_channels/data/native/native_datasource.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/di_test_utils.dart';

void main() {
  late NativeDataSource mockNativeDataSource;
  late Repository repository;

  setUp(() {
    mockNativeDataSource = NativeDataSourceMock();
    repository = RepositoryImpl(nativeDataSource: mockNativeDataSource);
  });

  group('getTemperature', () {
    group('happy scenarios', () {
      test(
          'Get the temperature from the native data source with a positive value',
          () async {
        // Arrange
        const int expectedResult = 10;
        when(mockNativeDataSource.getTemperature())
            .thenAnswer((_) async => expectedResult);

        // Act
        final result = await repository.getTemperature();

        // Assert
        expect(result, expectedResult);
      });

      test(
          'Get the temperature from the native data source with a negative value',
          () async {
        // Arrange
        const int expectedResult = -10;
        when(mockNativeDataSource.getTemperature())
            .thenAnswer((_) async => expectedResult);

        // Act
        final result = await repository.getTemperature();

        // Assert
        expect(result, expectedResult);
      });
    });

    group('error scenarios', () {
      test(
          'return temperature with 0 value when native fails to return temperature it fails',
          () async {
        // Arrange
        const int expectedResult = 0;
        when(mockNativeDataSource.getTemperature()).thenAnswer(
          (_) async => throw PlatformException(code: ''),
        );

        // Act
        final result = await repository.getTemperature();

        // Assert
        expect(result, expectedResult);
      });
    });
  });
}
