import 'package:flutter/material.dart';

void main() {
  runApp(MaterialDemoApp());
}

class MaterialDemoApp extends StatelessWidget {
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
          leading: Text("Leading widget"),
          title: Text("App title"),
          actions: <Widget>[
            Text("Action1"),
            Text("Action2")
          ],
        ),
      ),
    );
  }
}
