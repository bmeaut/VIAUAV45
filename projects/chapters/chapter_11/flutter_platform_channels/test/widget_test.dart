// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_channels/main.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_platform_channels/ui/home/home.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_error.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_loading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeBlock extends Mock implements HomeBloc {}

void main() {
  MockHomeBlock homeBloc;

  setUp(() {
    homeBloc = MockHomeBlock();
  });

  Widget getWidget(HomeBloc bloc) {
    when(bloc.stream).thenAnswer((realInvocation) => const Stream.empty());
    return MaterialApp(
      home: BlocProvider<HomeBloc>(
        create: (context) => bloc,
        child: MyHomePage(),
      ),
    );
  }

  group('happy scenarios', () {
    testWidgets('MyHomePage has a title', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget(homeBloc));

      // Verifications.
      expect(find.text("Flutter Platform Channels demo - updated"),
          findsOneWidget);
    });

    testWidgets('Test render loaded state', (WidgetTester tester) async {
      // ARRANGE
      when(homeBloc.state).thenReturn(HomeStateLoaded(temperature: 10));
      final widget = getWidget(homeBloc);

      // ACT
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle(Duration(seconds: 1));

      // Verifications.
      expect(find.text("Flutter Platform Channels demo - updated"),
          findsOneWidget);
      expect(find.text('0'), findsNothing);
      expect(find.textContaining('Received'), findsOneWidget);
      //expect(find.textContaining('10'), findsOneWidget);
    });

    testWidgets('Test render loading', (tester) async {
      // ARRANGE
      when(homeBloc.state).thenReturn(HomeStateLoading());
      final widget = getWidget(homeBloc);

      // ACT
      await tester.pumpWidget(widget);

      // Verifications.
      expect(find.byType(HomeLoading), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
  group('error scenarios', () {
    testWidgets('Test render error', (tester) async {
      // ARRANGE
      when(homeBloc.state).thenReturn(HomeStateError());
      final widget = getWidget(homeBloc);

      // ACT
      await tester.pumpWidget(widget);

      // Verifications.
      expect(find.byType(HomeError), findsOneWidget);
    });
  });
}
