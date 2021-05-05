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
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomeBlock extends Mock implements HomeBloc {}

void main() {
  MockHomeBlock homeBlock;

  setUp(() {
    homeBlock = MockHomeBlock();
  });

  testWidgets('MyHomePage has a title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verifications.
    expect(
        find.text("Flutter Platform Channels demo - updated"), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('MyHomePage has a title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (_) => getHomeBloc(),
        child: MyHomePage(),
      ),
    ));

    // Verifications.
    expect(
        find.text("Flutter Platform Channels demo - updated"), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
