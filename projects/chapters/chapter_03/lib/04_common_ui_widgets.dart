import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Essential Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EssentialWidgetsDemoPage(title: 'Flutter Essential Widgets Demo'),
    );
  }
}

class EssentialWidgetsDemoPage extends StatefulWidget {
  EssentialWidgetsDemoPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _EssentialWidgetsDemoPageState createState() => _EssentialWidgetsDemoPageState();
}

class _EssentialWidgetsDemoPageState extends State<EssentialWidgetsDemoPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
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
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
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
                      headers: {"Authorization": "Bearer 0123456789"},
                    ),
                  ),
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    // style: Theme.of(context).textTheme.headline4,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
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
        child: Icon(
          CupertinoIcons.add_circled,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
