import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'counter_button.dart';
import 'counter_text.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<Counter>(
            builder:
                (context, counter, _) =>
                    Text("My counter application: ${counter.count}"),
          ),
        ),
        body: Center(
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              const CounterText(),
            ],
          ),
        ),
        floatingActionButton: const CounterButton(),
      ),
    );
  }
}
