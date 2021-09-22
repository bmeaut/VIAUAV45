import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_event.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_state.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final ArticleInteractor _articleInteractor;

  ArticleListBloc(
    this._articleInteractor,
  ) : super(Loading());

  @override
  Stream<ArticleListState> mapEventToState(ArticleListEvent event) async* {
    if (event is LoadArticlesEvent) {
      yield* _mapLoadArticlesToState();
    } else if (event is RefreshArticlesEvent) {
      yield* _mapRefreshArticlesEvent();
    }
  }

  Stream<ArticleListState> _mapLoadArticlesToState() async* {
    try {
      print("Refreshing Articles");
      await _articleInteractor.refreshArticles();
    } on Exception catch (e) {
      print("Refreshing Articles failed, reason: ${e.toString()}");
      yield Error(articles: []);
    }

    print("Getting Articles from DB");
    final articles = await _articleInteractor.getArticles();

    print("Articles refreshed, sending Content state with Article list");
    yield ContentReady(articles: articles);
  }

  Stream<ArticleListState> _mapRefreshArticlesEvent() async* {
    final currentState = state;
    if (!(currentState is Refreshing)) {
      if (currentState is Content) {
        print("Article refreshing requested");
        yield Refreshing(articles: currentState.articles);

        try {
          print("Refreshing Articles");
          await _articleInteractor.refreshArticles();
        } catch (e) {
          print(
              "Refreshing Articles failed, reason: ${e.toString()}, sending Error state");
          yield Error(articles: currentState.articles);
        }
      }
    }

    print("Getting Articles from DB");
    final articles = await _articleInteractor.getArticles();

    yield ContentReady(articles: articles);
  }
}
