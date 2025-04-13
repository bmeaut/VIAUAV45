import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_details_cubit.dart';
import 'package:todo_app/data/database/data_source.dart';
import 'package:todo_app/ui/list/todo_list_item.dart';
import 'package:todo_app/util.dart';

class TodoDetails extends StatefulWidget {
  final int todoId;

  const TodoDetails(this.todoId, {super.key});

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  _TodoDetailsState();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoDetailsCubit>(
      create:
          (context) =>
              TodoDetailsCubit(context.read<DataSource>(), widget.todoId),
      child: Scaffold(
        appBar: AppBar(title: const Text("Todo Details")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TodoDetailsCubit, TodoState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TodoLoaded) {
                final todo = state.todo;
                return Column(
                  children: [
                    Row(
                      children: [
                        TodoPriorityIndicator(todo.priority),
                        Checkbox(value: todo.isDone, onChanged: null),
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

  const TodoDataRow({super.key, required this.rowTitle, required this.rowData});

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
