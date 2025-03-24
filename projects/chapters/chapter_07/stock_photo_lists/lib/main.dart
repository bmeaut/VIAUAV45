import 'package:flutter/material.dart';
import 'package:stock_photo_lists/pages/detailed_page.dart';

import 'pages/list_page.dart';

void main() {
  runApp(const ListAndGridApp());
}

class ListAndGridApp extends StatelessWidget {
  const ListAndGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const ListPage(),
      routes: {"/details": (context) => const DetailedPage()},
    );
  }
}
