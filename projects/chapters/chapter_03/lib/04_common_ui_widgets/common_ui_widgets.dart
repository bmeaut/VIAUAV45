import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EssentialWidgetsDemoApp());
}

class EssentialWidgetsDemoApp extends StatelessWidget {
  const EssentialWidgetsDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Essential Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EssentialWidgetsDemoPage(title: 'Flutter Essential Widgets Demo'),
    );
  }
}

class EssentialWidgetsDemoPage extends StatefulWidget {
  const EssentialWidgetsDemoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EssentialWidgetsDemoPage> createState() => _EssentialWidgetsDemoPageState();
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                  width: 8,
                ),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.android,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                      Icon(
                        Icons.alarm,
                        color: Colors.orangeAccent,
                        size: 40,
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/images/logo_flutter.png',
                      height: 100,
                    ),
                  ),
                  SizedBox(
                      width: 80,
                      height: 20,
                      child: Container(
                        color: Colors.brown,
                      )
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      "https://picsum.photos/150",
                      color: Colors.red,
                      colorBlendMode: BlendMode.colorBurn,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      headers: const {"Authorization": "Bearer 0123456789"},
                    ),
                  ),
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    // style: Theme.of(context).textTheme.headline4,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 250,
            top: 230,
            child: Image.asset(
              'assets/images/logo_flutter.png',
              height: 100,
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: Text("Centered Text"),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(
          CupertinoIcons.add_circled,
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}
