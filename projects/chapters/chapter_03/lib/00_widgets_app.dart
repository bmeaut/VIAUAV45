import 'package:flutter/widgets.dart';

void main() {
  runApp(WidgetsAppDemo());
}

class WidgetsAppDemo extends StatelessWidget {
  Route generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return WidgetsAppDemoPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'WidgetsApp Demo',
      // Theming is very limited with WidgetsApp only.
      color: Color.fromARGB(255, 0, 255, 0),
      initialRoute: "/",
      // If we use multiple pages, we have to define exactly how navigation should happen between them.
      onGenerateRoute: generateRoutes,
      textStyle: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class WidgetsAppDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              "The Main Menu of an\nEpic Game",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "New Game",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Load Game",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Exit",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
