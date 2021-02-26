import 'package:flutter/material.dart';
import 'package:flutter_counter_provider/bloc/counter_bloc.dart';
import 'package:provider/provider.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterBloc>().add(CounterIncrementEvent());
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
