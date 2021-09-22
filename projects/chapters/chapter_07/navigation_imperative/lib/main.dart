import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/first_page.dart';
import 'pages/parameter_page.dart';
import 'pages/second_page.dart';

void main() {
  runApp(ImperativeNavigationApp());
}

class ImperativeNavigationApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperative Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      routes: {
        "/firstpage": (context) => FirstPage(),
        "/secondpage": (context) => SecondPage(),
      },
      onGenerateRoute: (route) {
        // switch (route.name) {
        //   case "/parameterpage":
        //     return MaterialPageRoute(
        //       settings: RouteSettings(name: "/parameterpage"),
        //       builder: (context) => ParameterPage(
        //         parameter: route.arguments.toString(),
        //       ),
        //     );
        // }
        // if (route.name?.contains("/parameterpage/") ?? false) {
        //   final routeName = route.name!;
        //   final arg =
        //       routeName.substring(routeName.lastIndexOf("/")+1, routeName.length);
        //   return MaterialPageRoute(
        //     settings: RouteSettings(name: "/parameterpage/$arg"),
        //     builder: (context) => ParameterPage(
        //       parameter: Uri.decodeFull(arg),
        //     ),
        //   );
        // }
        return null;
      },
      onUnknownRoute: (route) {
        return MaterialPageRoute(
          builder: (_) => ParameterPage(
            parameter: route.toString(),
          ),
        );
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text("Do you really want to quit?"),
              actions: [
                TextButton(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                TextButton(
                  child: Text("Yes"),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            );
          },
        );
        return result ?? false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Main page")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is the main page!"),
              ElevatedButton(
                child: Text("Go to first page"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/firstpage",
                  );
                },
              ),
              ElevatedButton(
                child: Text("Go to second page"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/secondpage",
                  );
                },
              ),
              ElevatedButton(
                child: Text("Go to parameter page"),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/parameterpage",
                    arguments: "Hello",
                  );
                },
              ),
              ElevatedButton(
                child: Text("Go back"),
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
