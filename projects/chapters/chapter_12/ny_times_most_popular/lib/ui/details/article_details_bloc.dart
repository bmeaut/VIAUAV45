import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';

import 'article_details_event.dart';
import 'article_details_state.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  final ArticleInteractor _articleInteractor;

  ArticleDetailsBloc(
    this._articleInteractor,
  ) : super(Loading()) {
    on<LoadArticleEvent>(
      (event, emit) async {
        print("Fetching Article from DB with id: ${event.id}");
        final article = await _articleInteractor.getArticleById(event.id);

        if (article != null) {
          print("Article fetched, sending ContentReady state with Article");
          emit(ContentReady(article: article));
        } else {
          print("Article with ID ${event.id} was not found!");
          emit(Error());
        }
      },
    );
  }
}
