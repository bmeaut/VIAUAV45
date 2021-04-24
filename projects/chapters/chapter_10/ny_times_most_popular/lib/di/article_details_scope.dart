import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/ui/details/article_details_bloc.dart';

import 'di_utils.dart';

class ArticleDetailsScope extends Scope {
  ArticleDetailsScope({required Widget injectionTarget}) : super(injectionTarget);

  @override
  Widget buildDependencyTree({required Widget injectionTarget}) {
    return MultiBlocProvider(
      providers: [
        _provideArticleDetailsBloc(),
      ],
      child: injectionTarget,
    );
  }

  BlocProvider<ArticleDetailsBloc> _provideArticleDetailsBloc() {
    return BlocProvider<ArticleDetailsBloc>(
      create: (context) {
        return ArticleDetailsBloc(
          context.getElement<ArticleInteractor>(),
        );
      },
    );
  }
}