import 'package:flutter/material.dart';
import 'package:ny_times_most_popular/di/di_utils.dart';
import 'package:ny_times_most_popular/ui/articles/article_list.dart';
import 'package:ny_times_most_popular/ui/details/article_details.dart';

void main() {
  initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NytApp());
}

const LIST_PAGE = "/articles";
const DETAIL_PAGE = "/details";

class NytApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT Most Popular',
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
}
