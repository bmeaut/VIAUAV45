import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_counter_bloc/bloc/counter_state.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      buildWhen: (_, state) => state is! CounterErrorEventState,
      builder: (context, state) {
        if (state is CounterLoadingState) {
          return CircularProgressIndicator();
        } else if (state is CounterCountState) {
          return Text(
            state.count.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          );
        } else if (state is CounterInitial) {
          return Text(
            "Press the button!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
