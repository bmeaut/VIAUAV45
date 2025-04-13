import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/database/data_source.dart';

import 'data/database/floor/floor_todo_repository.dart';
import 'ui/list/todo_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataSource = DataSource(FloorTodoRepository());

  await dataSource.init();

  runApp(
    Provider<DataSource>(
      create: (_) => dataSource,
      child: const AwesomeTodoApp(),
    ),
  );
}

class AwesomeTodoApp extends StatelessWidget {
  const AwesomeTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'TodoApp', home: const TodoListPage());
  }
}
