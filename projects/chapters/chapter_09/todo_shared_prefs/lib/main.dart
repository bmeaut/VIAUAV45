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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoListPage(),
    );
  }
}
