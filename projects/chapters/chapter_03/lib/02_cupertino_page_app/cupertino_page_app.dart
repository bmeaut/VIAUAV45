import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoDemoApp());
}

class CupertinoDemoApp extends StatelessWidget {
  const CupertinoDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: "Cupertino Page Demo",
      home: CupertinoDemoHomePage(),
    );
  }
}

class CupertinoDemoHomePage extends StatelessWidget {
  const CupertinoDemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        // leading: CupertinoNavigationBarBackButton(previousPageTitle: "Back",), // Only works when a valid navigation route exists to a previous page
        middle: Text("Page title"),
        trailing: Icon(CupertinoIcons.info),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("App body"),
            CupertinoButton(
              child: const Text("Press me"),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder:
                      (_) => CupertinoAlertDialog(
                        title: const Text("Good job!"),
                        content: const Text("Now press OK"),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: const Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
