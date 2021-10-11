import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_provider/cubit/counter_cubit.dart';
import 'package:provider/provider.dart';


class CounterText extends StatelessWidget{
  const CounterText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      buildWhen: (_, state) => state is! CounterErrorEventState,
      builder: (context, state) {
        if (state is CounterLoadState){
          return CircularProgressIndicator();
        } else if (state is CounterCountState){
          return Text(
            state.count.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          );
        } else if (state is CounterInitial){
          return Text(
            "Press the button!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          );
        } else {
          return Container();
        }
      },
    );
  }

}