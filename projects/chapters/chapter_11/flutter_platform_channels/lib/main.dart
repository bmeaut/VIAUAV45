import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _platformSpecificData = 'Unknown';

  @override
  void initState() {
    super.initState();
    //Fetch the platform-specific data:
    _getPlatformSpecificData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Platform Channels demo"),
      ),
      body: Center(
        child: Text(
          'Received data from native:\n$_platformSpecificData',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Get platform-specific data.
  Future<void> _getPlatformSpecificData() async {
    // Create a MethodChannel.
    const platformChannel = const MethodChannel("hu.bme.aut.flutter/data");

    try {
      final int result =
          await platformChannel.invokeMethod('getPlatformSpecificData');
      setState(() {
        _platformSpecificData = "$result in Celsius";
      });
    } on PlatformException catch (error) {
      setState(() {
        _platformSpecificData =
            "Failed to get platform specific data: '${error.message}'.";
      });
    }
  }
}
