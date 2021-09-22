abstract class TodoRepository<T> {
  Future<void> init();

  Future<List<T>> getAllTodos();

  Future<T?> getTodo(int id);

  Future<void> upsertTodo(T todo);

  Future<void> deleteTodo(T todo);
}
