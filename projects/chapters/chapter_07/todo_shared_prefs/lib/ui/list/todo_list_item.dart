import 'package:awesome_todo_app/domain/model/todo.dart';
import 'package:awesome_todo_app/domain/model/todo_priority.dart';
import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo todo) onTap;
  final Function(Todo todo, bool isDone) onDoneChanged;
  final Function(Todo todo) onDeletePressed;

  TodoListItem(
    this.todo, {
    required this.onTap,
    required this.onDoneChanged,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ObjectKey(todo),
      onTap: () => onTap(todo),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodoPriorityIndicator(todo.priority),
          ),
          Checkbox(
            value: todo.isDone,
            onChanged: (isDone) => onDoneChanged(todo, isDone!),
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
            icon: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
            onPressed: () => onDeletePressed(todo),
          ),
        ],
      ),
    );
  }
}

class TodoPriorityIndicator extends StatelessWidget {
  final TodoPriority priority;

  TodoPriorityIndicator(this.priority);

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

    return Container(
      width: 16,
      height: 16,
      child: Material(
        shape: CircleBorder(),
        color: indicatorColor,
        elevation: 4,
      ),
    );
  }
}
