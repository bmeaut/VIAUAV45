import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:todo_app/data/database/floor/floor_todo.dart';

import 'floor_todo_dao.dart';

part 'floor_todo_database.g.dart';

@Database(version: 1, entities: [FloorTodo])
abstract class FloorTodoDatabase extends FloorDatabase {
  FloorTodoDao get todoDao;
}
