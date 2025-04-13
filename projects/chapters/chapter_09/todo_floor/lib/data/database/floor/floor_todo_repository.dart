import 'package:todo_app/data/database/floor/floor_todo_database.dart';
import 'package:todo_app/data/database/todo_repository.dart';

import 'floor_todo.dart';
import 'floor_todo_dao.dart';

class FloorTodoRepository implements TodoRepository<FloorTodo> {
  late FloorTodoDao todoDao;

  @override
  Future<void> init() async {
    final database =
        await $FloorFloorTodoDatabase.databaseBuilder("floor_todo.db").build();
    todoDao = database.todoDao;
  }

  @override
  Future<List<FloorTodo>> getAllTodos() {
    return todoDao.getAllTodos();
  }

  @override
  Future<FloorTodo> getTodo(int id) async {
    final todo = await todoDao.getTodo(id);
    if (todo == null) {
      throw Exception("Invalid TODO ID");
    } else {
      return todo;
    }
  }

  @override
  Future<void> deleteTodo(FloorTodo todo) {
    return todoDao.deleteTodo(todo.id ?? -1);
  }

  @override
  Future<void> upsertTodo(FloorTodo todo) {
    return todoDao.upsertTodo(todo);
  }
}
