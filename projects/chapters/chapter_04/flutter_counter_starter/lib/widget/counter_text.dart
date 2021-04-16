import 'package:flutter/material.dart';
import 'package:flutter_counter_provider/counter.dart';
import 'package:provider/provider.dart';

class CounterText extends StatelessWidget{
  //TODO: Read count value

  @override
  Widget build(BuildContext context) {
    var counter = context.watch<Counter>();
    return Text(
      "${counter.count}",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}