enum TodoPriority { LOW, NORMAL, HIGH }

TodoPriority todoPriorityFromInt(int index) {
  switch (index) {
    case 0:
      return TodoPriority.LOW;
    case 1:
      return TodoPriority.NORMAL;
    case 2:
      return TodoPriority.HIGH;
    default:
      throw ArgumentError(
        "Invalid Todo priority encountered while parsing from int",
      );
  }
}
