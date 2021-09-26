import 'package:floor/floor.dart';

import 'floor_todo.dart';

@dao
abstract class FloorTodoDao {
  @Query('SELECT * FROM todo')
  Future<List<FloorTodo>> getAllTodos();

  @Query('SELECT * FROM todo WHERE id = :id')
  Future<FloorTodo?> getTodo(int id);

  @Query("DELETE FROM todo WHERE id = :id")
  Future<void> deleteTodo(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> upsertTodo(FloorTodo todo);
}
