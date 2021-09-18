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
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              "The Main Menu of a\nLegendary Game",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              child: const Text(
                "New Game",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: const SizedBox(
                          width: 200,
                          height: 200,
                          child: Center(
                            child: Text("New Game clicked"),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Load Game",
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
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
