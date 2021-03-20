import 'package:flutter/material.dart';
import 'package:flutter_http/list_page.dart';

void main() {
  runApp(MyApp());
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPageWidget(),
    );
  }
}