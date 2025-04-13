import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_shared_prefs/data/database/data_source.dart';

import 'data/database/memory/memory_todo_repository.dart';
import 'ui/list/todo_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataSource = DataSource(MemoryTodoRepository());

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
    return MaterialApp(
      title: 'AwesomeTodoApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TodoListPage(),
    );
  }
}
