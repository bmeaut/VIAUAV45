import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoDemoApp());
}

class CupertinoDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Cupertino Page Demo",
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // leading: CupertinoNavigationBarBackButton(previousPageTitle: "Back",), // Only works when a valid navigation route exists to a previous page
          middle: Text("Page title"),
          trailing: Icon(CupertinoIcons.info),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("App body"),
              CupertinoButton(
                child: Text("Press me"),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: Text("Good job!"),
                      content: Text("Now press OK"),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text("OK"),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
