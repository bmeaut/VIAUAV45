import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_shared_prefs/bloc/todos_cubit.dart';
import 'package:todo_shared_prefs/domain/model/todo.dart';
import 'package:todo_shared_prefs/domain/model/todo_priority.dart';
import 'package:todo_shared_prefs/ui/details/todo_details.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  const TodoListItem(Key key, this.todo) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodosCubit>();
    return InkWell(
      key: ObjectKey(todo),
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => TodoDetails(todo.id!)));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodoPriorityIndicator(todo.priority),
          ),
          Checkbox(
            value: todo.isDone,
            onChanged: (isDone) {
              if (isDone != null) {
                cubit.upsertTodo(todo.copyWith(isDone: isDone));
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(todo.title)],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.grey),
            onPressed: () {
              cubit.deleteTodo(todo);
            },
          ),
        ],
      ),
    );
  }
}

class TodoPriorityIndicator extends StatelessWidget {
  final TodoPriority priority;

  const TodoPriorityIndicator(this.priority, {super.key});

  @override
  Widget build(BuildContext context) {
    Color indicatorColor;

    switch (priority) {
      case TodoPriority.low:
        indicatorColor = Colors.green;
        break;
      case TodoPriority.normal:
        indicatorColor = Colors.yellow;
        break;
      case TodoPriority.high:
        indicatorColor = Colors.red;
        break;
    }

    return SizedBox(
      width: 16,
      height: 16,
      child: Material(
        shape: const CircleBorder(),
        color: indicatorColor,
        elevation: 4,
      ),
    );
  }
}
