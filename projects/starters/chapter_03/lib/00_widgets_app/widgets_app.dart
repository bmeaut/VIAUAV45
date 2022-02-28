import 'package:flutter/widgets.dart';

void main() {
  runApp(const WidgetsAppDemo());
}

class WidgetsAppDemo extends StatelessWidget {
  const WidgetsAppDemo({Key? key}) : super(key: key);

  Route generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return const WidgetsAppDemoPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'WidgetsApp Demo',
      // Theming is very limited with WidgetsApp only.
      color: const Color.fromARGB(255, 0, 255, 0),
      initialRoute: "/",
      // If we use multiple pages, we have to define exactly how navigation should happen between them.
      onGenerateRoute: generateRoutes,
      textStyle: const TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class WidgetsAppDemoPage extends StatelessWidget {
  const WidgetsAppDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Text(
        "WidgetsApp Demo",
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    ); // TODO 0.1 Container + Column
  }
}
