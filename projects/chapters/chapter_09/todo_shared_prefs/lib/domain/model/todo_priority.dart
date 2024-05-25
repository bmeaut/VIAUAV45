enum TodoPriority {
  low,
  normal,
  high,
}

TodoPriority todoPriorityFromInt(int index) {
  switch (index) {
    case 0:
      return TodoPriority.low;
    case 1:
      return TodoPriority.normal;
    case 2:
      return TodoPriority.high;
    default:
      throw ArgumentError(
          "Invalid Todo priority encountered while parsing from int");
  }
}
