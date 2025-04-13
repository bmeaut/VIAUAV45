import '../../domain/model/todo.dart';
import 'todo_repository.dart';

class DataSource {
  final TodoRepository<Todo> database;

  DataSource(this.database);

  Future<void> init() async {
    await database.init();
  }

  Future<List<Todo>> getAllTodos() async {
    return database.getAllTodos();
  }

  Future<Todo> getTodo(int id) async {
    return database.getTodo(id);
  }

  Future<void> upsertTodo(Todo todo) async {
    return database.upsertTodo(todo);
  }

  Future<void> deleteTodo(Todo todo) async {
    return database.deleteTodo(todo);
  }

  Future<void> setTodoDone(Todo todo, bool isDone) async {
    Todo newTodo = Todo(
      id: todo.id,
      title: todo.title,
      dueDate: todo.dueDate,
      isDone: isDone,
      description: todo.description,
      priority: todo.priority,
    );
    return database.upsertTodo(newTodo);
  }
}
