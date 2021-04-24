import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart';

import 'di_utils.dart';

class ArticleListScope extends Scope {
  ArticleListScope({required Widget injectionTarget}) : super(injectionTarget);

  @override
  Widget buildDependencyTree({required Widget injectionTarget}) {
    return MultiBlocProvider(
      providers: [
        _provideArticleListBloc(),
      ],
      child: injectionTarget,
    );
  }

  BlocProvider<ArticleListBloc> _provideArticleListBloc() {
    return BlocProvider<ArticleListBloc>(
      create: (context) {
        return ArticleListBloc(
          context.getElement<ArticleInteractor>(),
        );
      },
    );
  }
}