import 'package:flutter/services.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/di_test_utils.dart';

void main() {
  HomeBloc bloc;
  Repository mockRepository;

  setUp(() {
    mockRepository = RepositoryMock();

    bloc = HomeBloc(repository: mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group("Happy Cases", () {
    test('when screen started', () {
      // Assert
      expect(
        bloc.state,
        equals(
          HomeStateInitial(),
        ),
      );
    });

    test('when temperature fetching starts and it loads with success', () {
      // Arrange
      final int expectedResult = 10;
      when(mockRepository.getTemperature())
          .thenAnswer((_) async => expectedResult);

      // Act
      bloc.add((HomeEventGetTemperature()));

      // Assert
      expectLater(
        bloc.stream,
        emitsInOrder(
          [
            HomeStateLoading(),
            HomeStateLoaded(temperature: expectedResult),
          ],
        ),
      );
    });
  });

  group("Error Cases", () {
    test("when temperature fetching starts but it fails", () {
      // Arrange
      when(mockRepository.getTemperature())
          .thenThrow(MissingPluginException('message'));

      // Act
      bloc.add((HomeEventGetTemperature()));

      // Assert
      expectLater(
        bloc.stream,
        emitsInOrder(
          [
            HomeStateLoading(),
            HomeStateError(),
          ],
        ),
      );
    });
  });
}
