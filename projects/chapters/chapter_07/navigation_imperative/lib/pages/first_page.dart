import 'package:flutter/material.dart';

import 'second_page.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.android,
                color: Colors.greenAccent,
                size: 120,
              ),
              const SizedBox(height: 16),
              const Text("This is the first page"),
              ElevatedButton(
                child: const Text("Navigate to second page"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
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
