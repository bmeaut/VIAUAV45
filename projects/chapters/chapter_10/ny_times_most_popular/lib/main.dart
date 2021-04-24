import 'package:flutter/material.dart';
import 'package:ny_times_most_popular/di/singleton_scope.dart';
import 'package:ny_times_most_popular/ui/articles/article_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NytApp());
}

class NytApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingletonScope(
      injectionTarget: MaterialApp(
        title: 'NYT Most Popular',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ArticleListPage(),
      ),
    );
  }
}
