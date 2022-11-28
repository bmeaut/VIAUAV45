// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ny_times_most_popular/data/disk/article_disk_data_source.dart'
    as _i7;
import 'package:ny_times_most_popular/data/disk/floor_database.dart' as _i4;
import 'package:ny_times_most_popular/data/network/article_network_data_source.dart'
    as _i8;
import 'package:ny_times_most_popular/data/network/dio_nyt_service.dart' as _i6;
import 'package:ny_times_most_popular/data/network/nyt_api.dart' as _i5;
import 'package:ny_times_most_popular/di/module/network_module.dart' as _i12;
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart'
    as _i9;
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart'
    as _i10;
import 'package:ny_times_most_popular/ui/details/article_details_bloc.dart'
    as _i11;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.Dio>(networkModule.dio);
    await gh.singletonAsync<_i4.FloorArticleDatabase>(
      () => _i4.FloorArticleDatabase.createDatabase(),
      preResolve: true,
    );
    gh.singleton<_i5.NytApi>(_i6.NytService(gh<_i3.Dio>()));
    gh.singleton<_i7.ArticleDiskDataSource>(
        _i7.ArticleDiskDataSource(gh<_i4.FloorArticleDatabase>()));
    gh.singleton<_i8.ArticleNetworkDataSource>(
        _i8.ArticleNetworkDataSource(gh<_i5.NytApi>()));
    gh.singleton<_i9.ArticleInteractor>(_i9.ArticleInteractor(
      gh<_i7.ArticleDiskDataSource>(),
      gh<_i8.ArticleNetworkDataSource>(),
    ));
    gh.factory<_i10.ArticleListBloc>(
        () => _i10.ArticleListBloc(gh<_i9.ArticleInteractor>()));
    gh.factory<_i11.ArticleDetailsBloc>(
        () => _i11.ArticleDetailsBloc(gh<_i9.ArticleInteractor>()));
    return this;
  }
}

class _$NetworkModule extends _i12.NetworkModule {}
