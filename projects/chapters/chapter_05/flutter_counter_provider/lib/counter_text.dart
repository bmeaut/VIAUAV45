import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = context.watch<Counter>();
    return Text(
      counter.count.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
