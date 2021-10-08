import 'package:flutter/material.dart';
import 'package:flutter_counter_provider/cubit/counter_cubit.dart';
import 'package:provider/provider.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterCubit = context.read<CounterCubit>();
    return FloatingActionButton(
      onPressed: () {
        counterCubit.incrementCounter();
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
