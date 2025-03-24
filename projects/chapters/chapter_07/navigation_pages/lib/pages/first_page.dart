import 'package:flutter/material.dart';

import '../main.dart';
import 'second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              const Icon(Icons.android, color: Colors.greenAccent, size: 120),
              const Text("This is the first page"),
              ElevatedButton(
                child: const Text("Navigate to the second page"),
                onPressed: () {
                  globalNavigatorHolderKey.currentState!.addNewPage(
                    SecondPage(key: UniqueKey()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
