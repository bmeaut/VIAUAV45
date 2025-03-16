import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = context.read<Counter>();
    return FloatingActionButton(
      onPressed: () {
        counter.incrementCounter();
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
