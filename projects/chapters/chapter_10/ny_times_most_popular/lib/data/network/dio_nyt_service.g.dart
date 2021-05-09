// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_nyt_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NytService implements NytService {
  _NytService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.nytimes.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<NetworkReply>> getArticles() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<NetworkReply>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '/svc/mostpopular/v2/mostviewed/all-sections/7.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NetworkReply.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
