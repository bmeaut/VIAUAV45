import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'pages/first_page.dart';
import 'pages/parameter_page.dart';
import 'pages/second_page.dart';

void main() {
  runApp(PageBasedNavigationApp());
}

var globalNavigatorHolderKey = GlobalKey<_NavigatorHolderState>();

class PageBasedNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page-based Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavigatorHolder(),
    );
  }
}

class NavigatorHolder extends StatefulWidget {
  NavigatorHolder() : super(key: globalNavigatorHolderKey);

  @override
  _NavigatorHolderState createState() => _NavigatorHolderState();
}

class _NavigatorHolderState extends State<NavigatorHolder> {
  List<Page> pages = [
    MaterialPage(child: MainPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: pages.toList(),
      onPopPage: (Route route, dynamic result) {
        setState(() {
          route.didPop(result);
          pages.removeLast();
        });
        return true;
      },
      onGenerateRoute: (route) {
        // switch (route.name) {
        //   case "/parameterpage":
        //     return MaterialPageRoute(
        //       builder: (context) => ParameterPage(
        //         settings: RouteSettings(name: "/parameterpage"),
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

  void addNewPage(Widget page) {
    setState(() {
      pages.add(MaterialPage(child: page));
    });
  }

  void replaceTopPage(Widget page) {
    setState(() {
      pages.removeLast();
      pages.add(MaterialPage(child: page));
    });
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

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
            });
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
                  globalNavigatorHolderKey.currentState!
                      .addNewPage(FirstPage());
                },
              ),
              ElevatedButton(
                child: Text("Go to second page"),
                onPressed: () {
                  globalNavigatorHolderKey.currentState!
                      .addNewPage(SecondPage());
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
