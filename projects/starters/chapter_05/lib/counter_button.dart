import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //TODO: increment on press
    return FloatingActionButton(
      onPressed: (){},
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}