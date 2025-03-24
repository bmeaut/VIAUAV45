import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/first_page.dart';
import 'pages/parameter_page.dart';
import 'pages/second_page.dart';

void main() {
  runApp(const ImperativeNavigationApp());
}

class ImperativeNavigationApp extends StatelessWidget {
  const ImperativeNavigationApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperative Navigation Demo',
      home: const MainPage(),
      // TODO 7.1 Add routes to FirstPage and SecondPage
      // TODO 7.8 Implement onGenerateRoute
      // TODO 7.2 Add unknown route handling
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO 7.3 Add PopScope
    return Scaffold(
      appBar: AppBar(title: const Text("Main page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            const Text("This is the main page!"),
            ElevatedButton(
              child: const Text("Go to first page"),
              onPressed: () {
                // TODO 7.4 Named navigation to "/firstpage"
              },
            ),
            ElevatedButton(
              child: const Text("Go to second page"),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SecondPage(),
                //   ),
                // );
                // TODO 7.5 Named navigation to "/secondpage"
              },
            ),
            ElevatedButton(
              child: const Text("Go to parameter page"),
              onPressed: () {
                // TODO 7.6 Named navigation to "/parameterpage" with parameter
              },
            ),
            ElevatedButton(
              child: const Text("Go back"),
              onPressed: () async {
                // TODO 7.3 maybePop
              },
            ),
          ],
        ),
      ),
    );
  }
}
