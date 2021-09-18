import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialDemoApp());
}

class MaterialDemoApp extends StatelessWidget {
  const MaterialDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        // primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: const Text("Leading widget"),
          title: const Text("App title"),
          actions: const [
            Text("Action1"),
            Text("Action2")
          ],
        ),
      ),
    );
  }
}
