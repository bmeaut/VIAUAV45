import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoTabsDemoApp());
}

class CupertinoTabsDemoApp extends StatelessWidget {
  const CupertinoTabsDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Cupertino Tabs Demo",
      theme: const CupertinoThemeData(),
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Products",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: "Cart",
            ),
          ],
        ),
        tabBuilder: (context, index) {
          late CupertinoTabView returnValue;
          switch (index) {
            case 0:
              returnValue = CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: Center(
                    child: Text("Products"),
                  ),
                );
              });
              break;
            case 1:
              returnValue = CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: Center(
                    child: Text("Search"),
                  ),
                );
              });
              break;
            case 2:
              returnValue = CupertinoTabView(builder: (context) {
                return const CupertinoPageScaffold(
                  child: Center(
                    child: Text("Cart"),
                  ),
                );
              });
              break;
          }
          return returnValue;
        },
      ),
    );
  }
}
