import 'package:flutter/widgets.dart';

import 'database/data_source.dart';

class DataSourceProvider extends InheritedWidget {
  final DataSource dataSource;

  DataSourceProvider({Key? key, required this.dataSource, required Widget child})
      : super(key: key, child: child);

  //region InheritedWidget implementation
  static DataSourceProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataSourceProvider>();
  }

  @override
  bool updateShouldNotify(DataSourceProvider old) => false;
  //endregion
}
