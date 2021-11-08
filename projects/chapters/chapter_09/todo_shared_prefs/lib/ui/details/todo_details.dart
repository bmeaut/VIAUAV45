import 'package:awesome_todo_app/bloc/todo_details_cubit.dart';
import 'package:awesome_todo_app/data/database/data_source.dart';
import 'package:awesome_todo_app/domain/model/todo.dart';
import 'package:awesome_todo_app/ui/list/todo_list_item.dart';
import 'package:awesome_todo_app/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDetails extends StatefulWidget {
  final int todoId;

  const TodoDetails(this.todoId, {Key? key}) : super(key: key);

  @override
  _TodoDetailsState createState() => _TodoDetailsState(todoId);
}

class _TodoDetailsState extends State<TodoDetails> {
  final int todoId;

  _TodoDetailsState(this.todoId);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoDetailsCubit>(
      create: (context) => TodoDetailsCubit(
        context.read<DataSource>(),
        todoId,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TodoDetailsCubit, TodoState>(
            builder: (context, state) {
              if(state is Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(state is TodoLoaded) {
                final todo = state.todo;
                return Column(
                  children: [
                    Row(
                      children: [
                        TodoPriorityIndicator(todo.priority),
                        Checkbox(
                          value: todo.isDone,
                          onChanged: null,
                        ),
                        Text(todo.title),
                      ],
                    ),
                    TodoDataRow(
                      rowTitle: "Description",
                      rowData: todo.description,
                    ),
                    TodoDataRow(
                      rowTitle: "Due date",
                      rowData: getFormattedDate(todo.dueDate),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class TodoDataRow extends StatelessWidget {
  final String rowTitle;
  final String rowData;

  const TodoDataRow({
    Key? key,
    required this.rowTitle,
    required this.rowData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          rowTitle.isNotEmpty ? Text("$rowTitle: ") : Container(),
          Text(rowData),
        ],
      ),
    );
  }
}
