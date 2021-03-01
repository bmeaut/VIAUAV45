import 'package:flutter/material.dart';
import 'package:flutter_counter_provider/bloc/counter_bloc.dart';
import 'package:provider/provider.dart';

class CounterText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var counterState = context.watch<CounterBloc>().state;
    var description = "";
    if (counterState is CounterCountState){
      description = counterState.count.toString();
    } else if (counterState is CounterInitialLoadedState){
      description = "Initial loaded";
    } else if (counterState is CounterLoadingState) {
      description = "Loading, please wait!";
    }
    return Text(
      description,
      style: Theme.of(context).textTheme.headline4,
    );
  }

}