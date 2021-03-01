import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_provider/cubit/counter_cubit.dart';
import 'widget/counter_button.dart';
import 'widget/counter_text.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              if (state is CounterCountState) {
                return Text("My counter application: ${state.count}");
              } else {
                return Text("Counter not counting!");
              }
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              CounterText(),
            ],
          ),
        ),
        floatingActionButton: CounterButton(),
      ),
    );
  }
}
