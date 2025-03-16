import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_counter_bloc/bloc/counter_event.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<CounterBloc>();
    return FloatingActionButton(
      tooltip: 'Increment',
      child: Icon(Icons.add),
      onPressed: () {
        bloc.add(CounterIncrementEvent());
      },
    );
  }
}
