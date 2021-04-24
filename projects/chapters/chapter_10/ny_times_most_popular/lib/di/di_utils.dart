import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

abstract class Scope extends StatelessWidget {
  final Widget _injectionTarget;

  Widget buildDependencyTree({required Widget injectionTarget});

  Scope(this._injectionTarget);

  @override
  Widget build(BuildContext context) {
    return buildDependencyTree(injectionTarget: _injectionTarget);
  }
}

extension BuildContextExt on BuildContext {
  T getElement<T>() {
    return Provider.of<T>(this, listen: false);
  }

  T getBloc<T extends Bloc>() {
    return BlocProvider.of<T>(this);
  }
}