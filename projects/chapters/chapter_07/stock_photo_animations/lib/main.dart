import 'package:flutter/material.dart';
import 'pages/list_page.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(const ListAndGridAnimatedApp());
  timeDilation = 5.0;
}

class ListAndGridAnimatedApp extends StatelessWidget {
  const ListAndGridAnimatedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ListPage(),
    );
  }
}