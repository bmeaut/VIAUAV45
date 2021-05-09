import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times_most_popular/data/disk/article_disk_data_source.dart';
import 'package:ny_times_most_popular/data/network/article_network_data_source.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';

import '../../di/di_test_utils.dart';

void main() {
  late ArticleDiskDataSource mockDiskDataSource;
  late ArticleNetworkDataSource mockNetworkDataSource;
  late ArticleInteractor interactor;

  setUp(() {
    mockDiskDataSource = initArticleDiskDataSource();
    mockNetworkDataSource = initArticleNetworkDataSource();

    interactor = initArticleInteractor();
  });

  group('getArticles', () {
    group('happy scenarios', () {
      test('Downloading articles from the disk data source successfully',
          () async {
        // Arrange
        final List<Article>? expectedResult = _mockArticles();
        when(mockDiskDataSource.getAllArticles())
            .thenAnswer((_) async => expectedResult);

        // Act
        final result = await interactor.getArticles();

        // Assert
        expect(result, expectedResult);
      });
    });

    group('error scenarios', () {
      test('Return empty list when disk data source fails', () async {
        // Arrange
        final expectedResult = [];
        when(mockDiskDataSource.getAllArticles()).thenThrow(Exception());

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

List<Article>? _mockArticles() {
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
