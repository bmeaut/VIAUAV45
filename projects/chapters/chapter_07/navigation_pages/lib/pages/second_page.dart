import 'package:flutter/material.dart';

import '../main.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              const FlutterLogo(size: 120),
              const Text("This is the second page"),
              ElevatedButton(
                child: const Text("Navigate to the same page"),
                onPressed: () {
                  globalNavigatorHolderKey.currentState!.replaceTopPage(
                    const SecondPage(),
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
