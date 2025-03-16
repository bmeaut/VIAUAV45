import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_provider/cubit/counter_cubit.dart';
import 'package:flutter_counter_provider/widgets/counter_button.dart';
import 'package:flutter_counter_provider/widgets/counter_text.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<CounterCubit, CounterState>(
          listenWhen: (_, state) => state is CounterErrorEventState,
          listener: (context, state) {
            var errorMessage = (state as CounterErrorEventState).message;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorMessage)));
          },
          buildWhen: (_, state) => state is! CounterErrorEventState,
          builder: (context, state) {
            var count = 0;
            if (state is CounterCountState) {
              count = state.count;
            } else if (state is CounterLoadState) {
              count = state.count;
            }
            return Text("My counter application: $count");
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
            const CounterText(),
          ],
        ),
      ),
      floatingActionButton: const CounterButton(),
    );
  }
}
