import 'package:flutter/material.dart';

void main() {
  runApp(const EssentialWidgetsDemoApp());
}

class EssentialWidgetsDemoApp extends StatelessWidget {
  const EssentialWidgetsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Essential Widgets',
      home: const EssentialWidgetsDemoPage(
        title: 'Flutter Essential Widgets Demo',
      ),
    );
  }
}

class EssentialWidgetsDemoPage extends StatefulWidget {
  const EssentialWidgetsDemoPage({super.key, required this.title});

  final String title;

  @override
  State<EssentialWidgetsDemoPage> createState() =>
      _EssentialWidgetsDemoPageState();
}

class _EssentialWidgetsDemoPageState extends State<EssentialWidgetsDemoPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        // TODO 4.7 Container TODO 4.8 Stack
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO 4.2 Row of Icons
            // TODO 4.3 AssetImage, Image.asset
            // TODO 4.6 SizedBox
            // TODO 4.4 Image.network (+4.5)
            const Text('You have pushed the button this many times:'),
            Text(
              // TODO 4.1 Text parameters
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
