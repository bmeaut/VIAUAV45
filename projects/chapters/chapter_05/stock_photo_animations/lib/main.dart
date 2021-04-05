import 'package:flutter/material.dart';
import 'pages/list_page.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(MyApp());
  timeDilation = 5.0;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListPage(),
    );
  }
}