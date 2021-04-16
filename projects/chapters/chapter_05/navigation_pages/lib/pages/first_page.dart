import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'second_page.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.android,
                color: Colors.lightGreenAccent,
                size: 120,
              ),
              SizedBox(height: 16),
              Text("This is the first page"),
              ElevatedButton(
                child: Text("Navigate to the second page"),
                onPressed: () {
                  globalNavigatorHolderKey.currentState!.addNewPage(SecondPage(key: UniqueKey(),));
                },
              ),
              ElevatedButton(
                child: Text("Back"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
