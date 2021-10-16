import 'package:flutter/material.dart';

import 'inputs_demo/form/real_estate_search_form_page.dart';

void main() {
  runApp(const InputWidgetsDemoApp());
}

class InputWidgetsDemoApp extends StatelessWidget {
  const InputWidgetsDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Real Estate Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RealEstateSearchFormPage(title: 'Flutter Real Estate Search'),
    );
  }
}
