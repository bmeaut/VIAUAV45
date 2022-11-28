import 'package:flutter/material.dart';
import 'package:ny_times_most_popular/di/injectable_di.dart';
import 'package:ny_times_most_popular/ui/articles/article_list.dart';
import 'package:ny_times_most_popular/ui/details/article_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NytApp());
}

const DETAIL_PAGE = "/details";

Future _dependencies = configureDependencies();

class NytApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dependencies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'NYT Most Popular App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: ArticleListPage(),
            onGenerateRoute: (settings) {
              final name = settings.name ?? "";
              if (name.startsWith(DETAIL_PAGE)) {
                return MaterialPageRoute(
                  builder: (context) {
                    return ArticleDetails(settings.arguments as int);
                  },
                );
              }
              return null;
            },
          );
        }

        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
