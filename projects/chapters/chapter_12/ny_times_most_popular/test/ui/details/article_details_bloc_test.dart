import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';
import 'package:ny_times_most_popular/ui/details/article_details_bloc.dart';
import 'package:ny_times_most_popular/ui/details/article_details_event.dart';
import 'package:ny_times_most_popular/ui/details/article_details_state.dart';

import 'article_details_bloc_test.mocks.dart';

@GenerateMocks([
  ArticleInteractor,
])
void main() {
  late ArticleDetailsBloc articleDetailsBloc;
  late ArticleInteractor mockInteractor;

  setUp(() {
    mockInteractor = MockArticleInteractor();

    articleDetailsBloc = ArticleDetailsBloc(
      mockInteractor,
    );
  });

  tearDown(() {
    articleDetailsBloc.close();
  });

  group("Happy Cases", () {
    test('When the article details screen is started', () {
      // Assert
      expect(articleDetailsBloc.state, equals(Loading()));
    });

    final mockedArticle = _mockArticle();
    final mockedId = mockedArticle.id;

    blocTest(
      "when LoadArticleEvent is launched the screen is loaded successfully",
      build: () => articleDetailsBloc,
      setUp: () => {
        when(mockInteractor.getArticleById(mockedId))
            .thenAnswer((_) async => mockedArticle)
      },
      act: (bloc) => {
        articleDetailsBloc.add(LoadArticleEvent(mockedId)),
      },
      expect: () => [
        ContentReady(article: mockedArticle),
      ],
    );
  });
}

Article _mockArticle() {
  return Article(
    id: 1,
    url: '',
    byLine: '',
    title: '',
    publishedDate: '',
    thumbUrl: '',
    largeUrl: '',
  );
}
