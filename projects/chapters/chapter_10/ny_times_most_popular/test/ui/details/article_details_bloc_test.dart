import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';
import 'package:ny_times_most_popular/ui/details/article_details_bloc.dart';
import 'package:ny_times_most_popular/ui/details/article_details_event.dart';
import 'package:ny_times_most_popular/ui/details/article_details_state.dart';

import '../../di/di_test_utils.dart';

void main() {
  late ArticleDetailsBloc bloc;
  late ArticleInteractor mockInteractor;

  setUp(() {
    mockInteractor = initArticleInteractor();

    bloc = ArticleDetailsBloc(
      mockInteractor,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group("Happy Cases", () {
    test('when screen started', () {
      // Assert
      expect(bloc.state, equals(Loading()));
    });
  });

  test('when LoadArticleEvent starts and it loads with success', () {
    // Arrange
    final mockedArticle = _mockArticle();
    final mockedId = mockedArticle.id;
    when(mockInteractor.getArticleById(mockedId))
        .thenAnswer((_) async => mockedArticle);

    // Act
    bloc.add(LoadArticleEvent(mockedId));

    // Assert
    expectLater(
      bloc,
      emitsInOrder(
        [
          Loading(),
          ContentReady(article: mockedArticle),
        ],
      ),
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
