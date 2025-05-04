import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  late Repository mockRepository;

  setUpAll(() {
    mockRepository = MockRepository();
  });

  test('initial state is HomeStateInitial', () {
    expect(
        HomeBloc(repository: mockRepository).state, equals(HomeStateInitial()));
  });

  group('HomeBloc Tests Using bloc_test', () {
    blocTest<HomeBloc, HomeState>(
      '''
     WHEN HomeEventGetTemperature is added
     AND repository succeeds with positive value
     THEN emits [Loading, Loaded]''',
      setUp: () {
        when(() => mockRepository.getTemperature()).thenAnswer((_) async => 10);
      },
      build: () => HomeBloc(repository: mockRepository),
      act: (bloc) => bloc.add(HomeEventGetTemperature()),
      expect: () => <HomeState>[
        HomeStateLoading(),
        HomeStateLoaded(temperature: 10),
      ],
      verify: (_) {
        verify(() => mockRepository.getTemperature()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<HomeBloc, HomeState>(
      '''
      WHEN HomeEventGetTemperature is added
      AND repository succeeds with negative value
      THEN emits [Loading, Loaded]''',
      setUp: () {
        when(() => mockRepository.getTemperature()).thenAnswer((_) async => -5);
      },
      build: () => HomeBloc(repository: mockRepository),
      act: (bloc) => bloc.add(HomeEventGetTemperature()),
      expect: () => <HomeState>[
        HomeStateLoading(),
        HomeStateLoaded(temperature: -5),
      ],
      verify: (_) {
        verify(() => mockRepository.getTemperature()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<HomeBloc, HomeState>(
      '''
      WHEN HomeEventGetTemperature is added
      AND repository throws MissingPluginException
      THEN emits [Loading, Error]''',
      setUp: () {
        when(() => mockRepository.getTemperature())
            .thenThrow(MissingPluginException('message'));
      },
      build: () => HomeBloc(repository: mockRepository),
      act: (bloc) => bloc.add(HomeEventGetTemperature()),
      expect: () => <HomeState>[
        HomeStateLoading(),
        HomeStateError(),
      ],
      verify: (_) {
        verify(() => mockRepository.getTemperature()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    blocTest<HomeBloc, HomeState>(
      '''
      WHENHomeEventGetTemperature is added
      AND repository throws PlatformException
      THEN emits [Loading, Error]''',
      setUp: () {
        when(() => mockRepository.getTemperature())
            .thenThrow(PlatformException(code: 'NATIVE_FAIL'));
      },
      build: () => HomeBloc(repository: mockRepository),
      act: (bloc) => bloc.add(HomeEventGetTemperature()),
      expect: () => <HomeState>[
        HomeStateLoading(),
        HomeStateError(),
      ],
      verify: (_) {
        verify(() => mockRepository.getTemperature()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
