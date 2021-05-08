import 'package:awesome_todo_app/data/database/data_source.dart';
import 'package:awesome_todo_app/domain/model/todo.dart';
import 'package:awesome_todo_app/ui/details/todo_details.dart';
import 'package:awesome_todo_app/ui/list/todo_list_item.dart';
import 'package:awesome_todo_app/ui/newtodo/add_todo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListPage extends StatefulWidget {
  final DataSource dataSource;

  TodoListPage({Key? key, required this.dataSource}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState(dataSource);
}

class _TodoListPageState extends State<TodoListPage> {
  DataSource _todosDataSource;
  late Future<List<Todo>> _todosFuture;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const HIDE_DONE_TODOS_KEY = "HIDE_DONE_TODOS";
  late Future<bool> _hideDoneTodos;

  _TodoListPageState(this._todosDataSource);

  @override
  void initState() {
    _todosFuture = _todosDataSource.getAllTodos();
    _hideDoneTodos = _prefs.then((prefs) {
      return prefs.getBool(HIDE_DONE_TODOS_KEY) ?? false;
    });
    super.initState();
  }

  void onPopupMenuItemClicked(String selectedItemValue) async {
    if (selectedItemValue == HIDE_DONE_TODOS_KEY) {
      final prefs = await _prefs;
      final hideDoneTodos = !(prefs.getBool(selectedItemValue) ?? false);
      refreshTodos(() {
        _hideDoneTodos = prefs.setBool(selectedItemValue, hideDoneTodos).then(
          (bool success) {
            return hideDoneTodos;
          },
        );
      });
    } else {
      // Do nothing
    }
  }

  void onDoneChanged(Todo todo, bool isDone) async {
    await _todosDataSource.setTodoDone(todo, isDone);
    refreshTodos();
  }

  void onDeletePressed(Todo todo) async {
    await _todosDataSource.deleteTodo(todo);
    refreshTodos();
  }

  void refreshTodos([Function? beforeRefresh]) {
    if (mounted) {
      setState(() {
        if (beforeRefresh != null) beforeRefresh();
        _todosFuture = _todosDataSource.getAllTodos();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        actions: [
          PopupMenuButton(
            onSelected: onPopupMenuItemClicked,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: HIDE_DONE_TODOS_KEY,
                  child: Row(
                    children: [
                      Text("Hide done todos"),
                      FutureBuilder<bool>(
                        future: _hideDoneTodos,
                        builder: (context, snapshot) {
                          if (snapshot.hasError ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting) {
                            return Checkbox(
                              tristate: true,
                              value: null,
                              onChanged: null,
                            );
                          } else {
                            return Checkbox(
                              value: snapshot.data,
                              onChanged: null,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ];
            },
          ),
        ],
      ),
      body: FutureBuilder<dynamic>(
          future: Future.wait<dynamic>([_todosFuture, _hideDoneTodos]),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasError) {
              return Center(
                child: Text(
                    "Oh no, something went wrong while loading the Todo list. :( reason: ${asyncSnapshot.error}"),
              );
            }

            if (asyncSnapshot.hasData) {
              List<Todo> items = (asyncSnapshot.data[0] as List<Todo>).toList();
              int itemCount = items.length;
              bool hideDoneTodos = asyncSnapshot.data[1] as bool;

              if (hideDoneTodos) {
                items.removeWhere((element) => element.isDone);
                itemCount = items.length;
              }

              return ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return TodoListItem(
                    items[index],
                    onTap: (todo) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TodoDetails(_todosDataSource, todo.id!)));
                    },
                    onDoneChanged: (todo, isDone) =>
                        onDoneChanged(todo, isDone),
                    onDeletePressed: (todo) => onDeletePressed(todo),
                  );
                },
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => AddTodoPage(_todosDataSource),
                ),
              )
              .then((value) => refreshTodos());
        },
        tooltip: 'New Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}
