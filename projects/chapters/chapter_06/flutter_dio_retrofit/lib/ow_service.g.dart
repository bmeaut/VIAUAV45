// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ow_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _OWService implements OWService {
  _OWService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.openweathermap.org/data/2.5/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<OWCitiesFindResponse> getOWCities(
      {latitude = 46.92393, longitude = 18.09012, count = 50}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': latitude,
      r'lon': longitude,
      r'cnt': count
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OWCitiesFindResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'find', data: _data,
                    queryParameters: queryParameters)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OWCitiesFindResponse.fromJson(_result.data!);
    return value;
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
