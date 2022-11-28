import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_most_popular/data/disk/article_disk_data_source.dart';
import 'package:ny_times_most_popular/data/network/article_network_data_source.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';

import 'article_interactor_test.mocks.dart';

@GenerateMocks([
  ArticleDiskDataSource,
  ArticleNetworkDataSource,
])
void main() {
  late ArticleDiskDataSource mockDiskDataSource;
  late ArticleNetworkDataSource mockNetworkDataSource;
  late ArticleInteractor interactor;

  setUp(() {
    mockDiskDataSource = MockArticleDiskDataSource();
    mockNetworkDataSource = MockArticleNetworkDataSource();

    interactor = ArticleInteractor(
      mockDiskDataSource,
      mockNetworkDataSource,
    );
  });

  group('getArticles', () {
    group('happy scenarios', () {
      test('Fetching articles from the disk data source successfully',
          () async {
        // Arrange
        final List<Article> expectedResult = _mockArticles();
        when(mockDiskDataSource.getAllArticles())
            .thenAnswer((_) async => expectedResult);

        // Act
        final result = await interactor.getArticles();

        // Assert
        expect(result, expectedResult);
      });
    });

    group('error scenarios', () {
      test('Return null when disk data source cannot fetch articles', () async {
        // Arrange
        final expectedResult = [];
        when(mockDiskDataSource.getAllArticles())
            .thenAnswer((_) async => null);

        // Act
        final result = await interactor.getArticles();

        // Assert
        expect(result, expectedResult);
      });
    });
  });

  group('refreshArticles', () {
    group('happy scenarios', () {
      test('Refresh articles from the network source successfully', () async {
        // Arrange
        final List<Article>? expectedResult = _mockArticles();
        when(mockNetworkDataSource.getArticles())
            .thenAnswer((_) async => expectedResult);
        when(mockDiskDataSource.saveArticles(expectedResult!))
            .thenAnswer((_) async => {});

        // Act
        // Assert
        expect(
          () async => await interactor.refreshArticles(),
          returnsNormally,
        );
      });
    });
    group('error scenarios', () {});
  });
  group('getArticleById', () {
    group('happy scenarios', () {});
    group('error scenarios', () {});
  });
}

List<Article> _mockArticles() {
  return [_mockArticle()];
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
