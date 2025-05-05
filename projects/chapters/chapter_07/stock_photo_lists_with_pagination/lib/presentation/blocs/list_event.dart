abstract class ListEvent {
  const ListEvent();
}

class ListFetchFirstPage extends ListEvent {
  const ListFetchFirstPage();
}

class ListFetchNextPage extends ListEvent {
  const ListFetchNextPage();
}

class ListRefresh extends ListEvent {
  const ListRefresh();
}
