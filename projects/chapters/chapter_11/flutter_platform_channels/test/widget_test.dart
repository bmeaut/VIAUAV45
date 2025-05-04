// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_platform_channels/ui/home/home_screen.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_error.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_loading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  late MockHomeBloc mockBloc;

  setUp(() {
    mockBloc = MockHomeBloc();

    when(() => mockBloc.stream).thenAnswer((_) => Stream<HomeState>.empty());
    when(() => mockBloc.state).thenReturn(HomeStateInitial());
  });

  Widget getWidget(HomeBloc bloc) {
    return MaterialApp(
      home: BlocProvider<HomeBloc>.value(
        // Use .value for existing mocks
        value: mockBloc,
        child: HomeScreen(),
      ),
    );
  }

  group('happy scenarios', () {
    testWidgets('Home screen has correct App Bar', (WidgetTester tester) async {
      // ARRANGE
      // ACT
      await tester.pumpWidget(getWidget(mockBloc));

      // ASSERT
      expect(find.text("Flutter Platform Channels demo"), findsOneWidget);
    });

    testWidgets('Test render loaded state', (WidgetTester tester) async {
      // ARRANGE
      const testTemp = 10;
      when(() => mockBloc.state)
          .thenReturn(HomeStateLoaded(temperature: testTemp));
      final widget = getWidget(mockBloc);

      // ACT
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle(Duration(seconds: 1));

      // ASSERT
      expect(find.text("Flutter Platform Channels demo"), findsOneWidget);
      expect(find.text('0'), findsNothing);
      expect(find.textContaining('Received'), findsOneWidget);
      expect(find.textContaining('10'), findsOneWidget);
    });

    testWidgets('Test render loading', (tester) async {
      // ARRANGE
      when(() => mockBloc.state).thenReturn(HomeStateLoading());
      final widget = getWidget(mockBloc);

      // ACT
      await tester.pumpWidget(widget);

      // ASSERT
      expect(find.byType(HomeLoadingWidget), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
  group('error scenarios', () {
    testWidgets('Test render error', (tester) async {
      // ARRANGE
      when(() => mockBloc.state).thenReturn(HomeStateError());
      final widget = getWidget(mockBloc);

      // ACT
      await tester.pumpWidget(widget);

      // ASSERT
      expect(find.byType(HomeErrorWidget), findsOneWidget);
    });
  });
}
