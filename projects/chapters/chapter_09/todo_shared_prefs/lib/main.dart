import 'package:awesome_todo_app/bloc/todos_cubit.dart';
import 'package:awesome_todo_app/data/database/data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/database/memory/memory_todo_repository.dart';
import 'data/datasource_provider.dart';
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
  const AwesomeTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AwesomeTodoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const TodoListPage(),
    );
  }
}
