import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class CounterText extends StatelessWidget{
  const CounterText();

  @override
  Widget build(BuildContext context) {
    var counter = context.watch<Counter>();
    return Text(
      counter.counterText.toString(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }

}