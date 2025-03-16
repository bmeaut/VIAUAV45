import 'package:flutter/material.dart';
import 'package:flutter_counter_provider/counter_button.dart';
import 'package:flutter_counter_provider/counter_text.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              CounterText(),
            ],
          ),
        ),
        floatingActionButton: CounterButton(),
      ),
    );
  }
}
