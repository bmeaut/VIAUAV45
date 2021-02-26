import 'package:flutter/material.dart';

class CounterText extends StatelessWidget{
  //TODO: Read count value

  @override
  Widget build(BuildContext context) {
    return Text(
      "<Count>",
      style: Theme.of(context).textTheme.headline4,
    );
  }

}