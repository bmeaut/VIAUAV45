import 'package:awesome_todo_app/domain/model/todo.dart';
import 'package:awesome_todo_app/domain/model/todo_priority.dart';
import 'package:awesome_todo_app/util.dart';
import 'package:awesome_todo_app/data/database/data_source.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  final DataSource _dataSource;


  AddTodoPage(this._dataSource);

  @override
  _AddTodoPageState createState() => _AddTodoPageState(_dataSource);
}

class _AddTodoPageState extends State<AddTodoPage> {
  final DataSource _dataSource;


  _AddTodoPageState(this._dataSource);

  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  var priority = TodoPriority.NORMAL;
  var dueDate = DateTime.now();

  _setPriority(TodoPriority todoPriority) {
    setState(() {
      priority = todoPriority;
    });
  }

  _setDueDate(DateTime dueDate) {
    setState(() {
      this.dueDate = dueDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new todo"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                textAlign: TextAlign.start,
              ),
              TextField(
                decoration:
                    InputDecoration(hintText: "Do something awesome today!"),
                controller: titleTextController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Description",
                  textAlign: TextAlign.start,
                ),
              ),
              TextField(
                controller: descriptionTextController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  "Priority",
                  textAlign: TextAlign.start,
                ),
              ),
              DropdownButton<TodoPriority>(
                value: priority,
                onChanged: (todoPriority) => _setPriority(todoPriority!),
                items: [
                  DropdownMenuItem(
                    onTap: () {},
                    value: TodoPriority.LOW,
                    child: Text("LOW"),
                  ),
                  DropdownMenuItem(
                    onTap: () {},
                    value: TodoPriority.NORMAL,
                    child: Text("NORMAL"),
                  ),
                  DropdownMenuItem(
                    onTap: () {},
                    value: TodoPriority.HIGH,
                    child: Text("HIGH"),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Text("Due date:"),
                  ),
                  Text(getFormattedDate(dueDate)),
                  TextButton(
                    child: Text("SELECT DATE"),
                    onPressed: showDueDatePicker,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await _dataSource.upsertTodo(
                          Todo(
                            title: titleTextController.text,
                            description: descriptionTextController.text,
                            dueDate: dueDate,
                            isDone: false,
                            priority: priority
                          )
                        );
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.add),
                      label: Text("CREATE TODO"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDueDatePicker() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 10, now.month, now.day),
    );
    if(date != null) {
      _setDueDate(date);
    }
  }
}
