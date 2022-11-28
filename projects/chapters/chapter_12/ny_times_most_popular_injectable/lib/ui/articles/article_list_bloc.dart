import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_event.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_state.dart';

@injectable
class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final ArticleInteractor _articleInteractor;

  ArticleListBloc(
    this._articleInteractor,
  ) : super(Loading()) {
    on<LoadArticlesEvent>(
      (event, emit) async {
        try {
          print("Refreshing Articles in the DB");
          await _articleInteractor.refreshArticles();
        } on Exception catch (e) {
          print("Refreshing Articles failed, reason: ${e.toString()}");
          emit(Error(articles: []));
        }

        print("Getting Articles from DB");
        final articles = await _articleInteractor.getArticles();

        print("Articles refreshed, sending Content state with Article list");
        emit(ContentReady(articles: articles));
      },
    );

    on<RefreshArticlesEvent>(
      (event, emit) async {
        final currentState = state;
        if (!(currentState is Refreshing)) {
          if (currentState is Content) {
            print("Article refreshing requested");
            emit(Refreshing(articles: currentState.articles));

            try {
              print("Refreshing articles in the local storage");
              await _articleInteractor.refreshArticles();
            } catch (e) {
              print(
                  "Refreshing Articles failed, reason: ${e.toString()}, sending Error state");
              emit(Error(articles: currentState.articles));
            }
          }
        }

        print("Getting Articles from DB");
        final articles = await _articleInteractor.getArticles();

        print("Articles refreshed, sending Content state with Article list");
        emit(ContentReady(articles: articles));
      },
    );
  }

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
