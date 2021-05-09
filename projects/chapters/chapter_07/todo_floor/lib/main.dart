import 'package:awesome_todo_app/data/database/data_source.dart';
import 'package:flutter/material.dart';

import 'data/database/floor/floor_todo_repository.dart';
import 'data/datasource_provider.dart';
import 'ui/list/todo_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataSource = DataSource(FloorTodoRepository());

  await dataSource.init();

  runApp(
    DataSourceProvider(
      dataSource: dataSource,
      child: AwesomeTodoApp(),
    ),
  );
}

class AwesomeTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AwesomeTodoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListPage(
        dataSource: DataSourceProvider.of(context)!.dataSource,
      ),
    );
  }
}
