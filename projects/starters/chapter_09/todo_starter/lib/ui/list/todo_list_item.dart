import 'package:awesome_todo_app/bloc/todos_cubit.dart';
import 'package:awesome_todo_app/domain/model/todo.dart';
import 'package:awesome_todo_app/domain/model/todo_priority.dart';
import 'package:awesome_todo_app/ui/details/todo_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  const TodoListItem(
    Key key,
    this.todo,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodosCubit>();
    return InkWell(
      key: ObjectKey(todo),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TodoDetails(todo.id!)));
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
              cubit.upsertTodo(todo.copyWith(isDone: isDone));
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(todo.title),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.grey,
            ),
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

  const TodoPriorityIndicator(this.priority, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color indicatorColor;

    switch (priority) {
      case TodoPriority.LOW:
        indicatorColor = Colors.green;
        break;
      case TodoPriority.NORMAL:
        indicatorColor = Colors.yellow;
        break;
      case TodoPriority.HIGH:
        indicatorColor = Colors.red;
        break;
      default:
        throw ArgumentError(
          "A Todo has an invalid priority. This should never happen.",
        );
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
