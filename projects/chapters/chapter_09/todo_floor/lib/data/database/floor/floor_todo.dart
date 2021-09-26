import 'package:floor/floor.dart';

@Entity(tableName: "todo")
class FloorTodo {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  String dueDate;
  int isDone;
  String description;
  int priority;

  FloorTodo({
    this.id,
    required this.title,
    required this.dueDate,
    required this.isDone,
    required this.description,
    required this.priority,
  });
}
