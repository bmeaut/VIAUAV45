import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_provider/bloc/counter_bloc.dart';
import 'package:flutter_counter_provider/widget/counter_button.dart';
import 'package:flutter_counter_provider/widget/counter_text.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc()..add(CounterInitialLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CounterBloc, CounterState>(
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
