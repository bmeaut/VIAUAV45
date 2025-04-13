import 'package:todo_app/domain/model/todo_priority.dart';

import '../../domain/model/todo.dart';
import '../../util.dart';
import 'floor/floor_todo.dart';
import 'todo_repository.dart';

class DataSource {
  final TodoRepository<FloorTodo> database;

  DataSource(this.database);

  Future<void> init() async {
    await database.init();
  }

  Future<List<Todo>> getAllTodos() async {
    final todos = await database.getAllTodos();
    return todos.map((floorTodo) => floorTodo.toDomainModel()).toList();
  }

  Future<Todo> getTodo(int id) async {
    final floorTodo = await database.getTodo(id);
    return floorTodo.toDomainModel();
  }

  Future<void> upsertTodo(Todo todo) async {
    return database.upsertTodo(todo.toDbModel());
  }

  Future<void> deleteTodo(Todo todo) async {
    return database.deleteTodo(todo.toDbModel());
  }

  Future<void> setTodoDone(Todo todo, bool isDone) async {
    return database.upsertTodo(todo.toDbModel()..isDone = isDone ? 1 : 0);
  }
}

extension TodoToFloorTodo on Todo {
  FloorTodo toDbModel() {
    return FloorTodo(
      id: id,
      title: title,
      description: description,
      priority: priority.index,
      isDone: isDone ? 1 : 0,
      dueDate: getFormattedDate(dueDate),
    );
  }
}

extension FloorTodoToTodo on FloorTodo {
  Todo toDomainModel() {
    TodoPriority priority;
    switch (this.priority) {
      case 0:
        priority = TodoPriority.LOW;
        break;
      case 1:
        priority = TodoPriority.NORMAL;
        break;
      case 2:
        priority = TodoPriority.HIGH;
        break;
      default:
        throw ArgumentError(
          "Invalid Todo priority encountered while mapping database object to domain object",
        );
    }
    return Todo(
      id: id,
      title: title,
      description: description,
      priority: priority,
      isDone: isDone == 1 ? true : false,
      dueDate: parseDate(dueDate),
    );
  }
}
