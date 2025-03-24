import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/first_page.dart';
import 'pages/parameter_page.dart';
import 'pages/second_page.dart';

void main() {
  runApp(const ImperativeNavigationApp());
}

class ImperativeNavigationApp extends StatelessWidget {
  const ImperativeNavigationApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperative Navigation Demo',
      home: const MainPage(),
      routes: {
        "/firstpage": (context) => const FirstPage(),
        "/secondpage": (context) => const SecondPage(),
      },
      onGenerateRoute: (route) {
        switch (route.name) {
          case "/parameterpage":
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/parameterpage"),
              builder:
                  (context) =>
                      ParameterPage(parameter: route.arguments.toString()),
            );
        }
        if (route.name?.contains("/parameterpage/") ?? false) {
          final routeName = route.name!;
          final arg = routeName.substring(
            routeName.lastIndexOf("/") + 1,
            routeName.length,
          );
          return MaterialPageRoute(
            settings: RouteSettings(name: "/parameterpage/$arg"),
            builder: (context) => ParameterPage(parameter: Uri.decodeFull(arg)),
          );
        }
        return null;
      },
      onUnknownRoute: (route) {
        return MaterialPageRoute(
          builder: (_) => ParameterPage(parameter: route.toString()),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you really want to quit'),
              actions: [
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Main page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("This is the main page!"),
              ElevatedButton(
                child: const Text("Go to first page"),
                onPressed: () {
                  Navigator.pushNamed(context, "/firstpage");
                },
              ),
              ElevatedButton(
                child: const Text("Go to second page"),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SecondPage(),
                  //   ),
                  // );
                  Navigator.pushNamed(context, "/secondpage");
                },
              ),
              ElevatedButton(
                child: const Text("Go to parameter page"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/parameterpage",
                    arguments: "Hello",
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Go back"),
                onPressed: () async {
                  var handledPop = await Navigator.maybePop(context);
                  if (!handledPop) {
                    SystemNavigator.pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
