# `flutter pub run build_runner watch --delete-conflicting-outputs` 

# TODO 2.1 _emitAllTodos()

```dart
final prefs = await SharedPreferences.getInstance();
final hideDoneTodos = prefs.getBool(HIDE_DONE_TODOS_KEY) ?? false;
if (!hideDoneTodos) {
  emit(
    TodosLoaded(todos: allTodos, hideDoneTodos: hideDoneTodos),
  );
} else {
  final todos = allTodos.where((todo) => !todo.isDone).toList();
  emit(
    TodosLoaded(todos: todos, hideDoneTodos: hideDoneTodos),
  );
}
```

# TODO 2.2 create HIDE_DONE_TODOS_KEY

 ```dart
 static const HIDE_DONE_TODOS_KEY = "HIDE_DONE_TODOS";
 ```

# TODO 2.3 Update prefs

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setBool(HIDE_DONE_TODOS_KEY, doneTodosVisible);
```

# TODO 3.1 replace with Floor

```dart
final dataSource = DataSource(FloorTodoRepository());
```

# TODO 3.2 Rewrite with model mapping

```dart
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
        dueDate: getFormattedDate(dueDate));
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
            "Invalid Todo priority encountered while mapping database object to domain object");
    }
    return Todo(
        id: id,
        title: title,
        description: description,
        priority: priority,
        isDone: isDone == 1 ? true : false,
        dueDate: parseDate(dueDate));
  }
}
```

 
