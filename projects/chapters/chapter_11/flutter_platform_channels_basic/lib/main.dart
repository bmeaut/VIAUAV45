import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<int> _platformSpecificData;

  @override
  void initState() {
    super.initState();

    /// Fetch the platform-specific data:
    _platformSpecificData = _getPlatformSpecificData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Platform Channels demo"),
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder<int>(
            future: _platformSpecificData, // The future we are monitoring
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshot.hasData) {
                return Center(
                  child: Text(
                    'Received data from native:\n${snapshot.data!}',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'No data received',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                );
              }
            }),
      ),
    );
  }

  /// Get platform-specific data.
  Future<int> _getPlatformSpecificData() async {
    /// Create a MethodChannel.
    const platformChannel = const MethodChannel("hu.bme.aut.flutter/data");
    try {
      final int result =
          await platformChannel.invokeMethod('getPlatformSpecificData');
      return result;
    } on PlatformException catch (error) {
      throw Exception("Failed to get platform data: ${error.message}");
    } catch (error) {
      throw Exception("Failed to get platform data: $error");
    }
  }

  Future<void> _handleRefresh() async {
    Future<int> newFuture = _getPlatformSpecificData();
    setState(() {
      _platformSpecificData = newFuture;
    });
    try {
      await newFuture;
    } catch (_) {
      // Handle the error if needed
    }
  }
}
