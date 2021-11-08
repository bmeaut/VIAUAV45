import 'package:awesome_todo_app/bloc/create_todo_cubit.dart';
import 'package:awesome_todo_app/data/database/data_source.dart';
import 'package:awesome_todo_app/domain/model/todo_priority.dart';
import 'package:awesome_todo_app/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  _AddTodoPageState();

  final titleTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTodoCubit>(
      create: (context) {
        return CreateTodoCubit(
          context.read<DataSource>(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add a new todo"),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<CreateTodoCubit, CreateTodoState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      textAlign: TextAlign.start,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          hintText: "Do something awesome today!"),
                      controller: titleTextController,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: Text(
                        "Description",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    TextField(
                      controller: descriptionTextController,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: Text(
                        "Priority",
                        textAlign: TextAlign.start,
                      ),
                    ),
                    DropdownButton<TodoPriority>(
                      value: state.todo.priority,
                      onChanged: (todoPriority) {
                        context.read<CreateTodoCubit>().updateState(
                              priority: todoPriority,
                            );
                      },
                      items: [
                        DropdownMenuItem(
                          onTap: () {},
                          value: TodoPriority.LOW,
                          child: const Text("LOW"),
                        ),
                        DropdownMenuItem(
                          onTap: () {},
                          value: TodoPriority.NORMAL,
                          child: const Text("NORMAL"),
                        ),
                        DropdownMenuItem(
                          onTap: () {},
                          value: TodoPriority.HIGH,
                          child: const Text("HIGH"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Text("Due date:"),
                        ),
                        Text(getFormattedDate(
                          state.todo.dueDate,
                        )),
                        TextButton(
                          child: const Text("SELECT DATE"),
                          onPressed: () => showDueDatePicker(
                              context.read<CreateTodoCubit>()),
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
                              await context.read<CreateTodoCubit>().submitTodo(
                                titleTextController.value.text,
                                descriptionTextController.value.text,
                              );
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("CREATE TODO"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void showDueDatePicker(CreateTodoCubit cubit) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 10, now.month, now.day),
    );
    if (date != null) {
      cubit.updateState(dueDate: date);
    }
  }

  @override
  void dispose() {
    titleTextController.dispose();
    descriptionTextController.dispose();
    super.dispose();
  }
}
