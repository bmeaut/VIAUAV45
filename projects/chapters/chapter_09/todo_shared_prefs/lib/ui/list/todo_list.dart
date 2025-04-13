import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_shared_prefs/bloc/todos_cubit.dart';
import 'package:todo_shared_prefs/data/database/data_source.dart';
import 'package:todo_shared_prefs/domain/model/todo.dart';
import 'package:todo_shared_prefs/ui/list/todo_list_item.dart';
import 'package:todo_shared_prefs/ui/newtodo/add_todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  _TodoListPageState();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosCubit>(
      create: (context) {
        return TodosCubit(context.read<DataSource>());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
          actions: [
            BlocBuilder<TodosCubit, TodosState>(
              builder: (context, state) {
                if (state is Loading) {
                  return Container();
                } else if (state is TodosLoaded) {
                  return PopupMenuButton<String>(
                    onSelected: (_) {
                      final cubit = context.read<TodosCubit>();
                      cubit.setDoneTodoVisibility(!state.hideDoneTodos);
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: TodosCubit.HIDE_DONE_TODOS_KEY,
                          child: Row(
                            children: [
                              if (state.hideDoneTodos) ...{
                                const Text("Show done todos"),
                              } else ...{
                                const Text("Hide done todos"),
                              },
                            ],
                          ),
                        ),
                      ];
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
        body: BlocBuilder<TodosCubit, TodosState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodosLoaded) {
              List<Todo> items = state.todos;
              int itemCount = items.length;

              return ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return TodoListItem(ObjectKey(items[index]), items[index]);
                },
              );
            } else {
              return Container();
            }
          },
        ),
        floatingActionButton: BlocBuilder<TodosCubit, TodosState>(
          builder:
              (context, state) => FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddTodoPage()),
                  ).then((_) => context.read<TodosCubit>().getTodos());
                },
                tooltip: 'New Todo',
                child: const Icon(Icons.add),
              ),
        ),
      ),
    );
  }
}
