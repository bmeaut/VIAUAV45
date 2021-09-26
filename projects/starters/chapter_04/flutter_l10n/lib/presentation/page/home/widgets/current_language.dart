import 'package:flutter/material.dart';

class CurrentLanguage extends StatelessWidget {
  const CurrentLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        const Text(
          "Current language: TODO",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Image.asset(
          "assets/icon/flag/en.png",
          height: 40,
          width: 60,
        ),
      ],
    );
  }
}
