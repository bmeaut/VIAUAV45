abstract class TodoRepository<T> {
  Future<void> init();

  Future<List<T>> getAllTodos();

  Future<T> getTodo(int id);

  Future<void> upsertTodo(T todo); // = Update or Insert

  Future<void> deleteTodo(T todo);
}
