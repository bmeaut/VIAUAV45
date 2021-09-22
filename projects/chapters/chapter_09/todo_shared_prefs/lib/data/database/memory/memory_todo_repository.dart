import 'dart:math';

import 'package:awesome_todo_app/data/database/todo_repository.dart';
import 'package:awesome_todo_app/domain/model/todo.dart';
import 'package:awesome_todo_app/domain/model/todo_priority.dart';

class MemoryTodoRepository implements TodoRepository<Todo> {
  final List<Todo> todos = [
    Todo(
      id: 0,
      title: "Update GitHub repo",
      dueDate: DateTime(2021, 3, 29),
      isDone: true,
      description: "git pull",
      priority: TodoPriority.NORMAL,
    ),
    Todo(
      id: 1,
      title: "Write Flutter homework",
      dueDate: DateTime(2021, 5, 1),
      isDone: true,
      description: "Simple multiplatform app",
      priority: TodoPriority.NORMAL,
    ),
    Todo(
      id: 2,
      title: "Have fun learning! :)",
      dueDate: DateTime(2021, 3, 29),
      isDone: false,
      description: "Don't forget to ask questions!",
      priority: TodoPriority.HIGH,
    )
  ];

  @override
  Future<void> init() async {}

  @override
  Future<void> deleteTodo(Todo todo) {
    return Future(() {
      todos.removeWhere((element) => element.id == todo.id);
    });
  }

  @override
  Future<List<Todo>> getAllTodos() {
    return Future.value(todos);
  }

  @override
  Future<Todo> getTodo(int id) {
    return Future.value(
      todos.firstWhere((element) => element.id == id),
    );
  }

  @override
  Future<void> upsertTodo(Todo todo) async {
    return Future(() {
      final index = todos.indexWhere((element) => element.id == todo.id);
      if (index == -1) {
        if (todo.id == 0 || todo.id == null) {
          if(todos.isEmpty) {
            todo.id = 0;
          } else {
            todo.id =
                todos.map((element) => element.id!).toList().reduce(max) + 1;
          }
        }
        todos.add(todo);
        return;
      } else {
        todos[index] = todo;
      }
    });
  }
}
