import 'package:flutter/material.dart';

class ParameterPage extends StatelessWidget {
  final String? parameter;

  const ParameterPage({super.key, this.parameter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parameter page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.android,
                color: Colors.lightGreenAccent,
                size: 120,
              ),
              const SizedBox(height: 16),
              const Text("This is the parameter page"),
              Text("Parameter value: $parameter"),
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
