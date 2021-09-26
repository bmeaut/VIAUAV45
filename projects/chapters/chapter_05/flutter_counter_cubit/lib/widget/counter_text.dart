import 'package:flutter/material.dart';
import 'package:flutter_counter_provider/cubit/counter_cubit.dart';
import 'package:provider/provider.dart';

class CounterText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var counterState = context.watch<CounterCubit>().state;
    return Text(
      counterState is CounterCountState ? counterState.count.toString() : "Initial",
      style: Theme.of(context).textTheme.headline4,
    );
  }

}