import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/main.dart';
import 'package:flutter_dio/ow_json_models.dart';

const _openWeatherApiKey = "e6932dac2b4ba21c31ba22d19f4ecc56";
const _baseUrl = "api.openweathermap.org";

class OWService {
  final _dio = Dio();

  OWService() {
    _dio.options.baseUrl = "https://$_baseUrl/data/2.5/";
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          final requestId = request.extra["requestId"] ?? "N/A";
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onRequest: Interceptor1 - Entered",
          );
          await Future.delayed(Duration(seconds: 1), () {
            debugPrint(
              "${DateTime.now().ssMMM} [$requestId] onRequest: Interceptor1 - Completed, calling next()",
            );
          });
          handler.next(request);
        },
        onResponse: (response, handler) {
          final requestId = response.requestOptions.extra["requestId"] ?? "N/A";
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onResponse: Interceptor1 - Entered",
          );
          handler.next(response);
        },
      ),
    );
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (request, handler) async {
          final requestId = request.extra["requestId"] ?? "N/A";
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onRequest: QueuedInterceptor2 - Entered, queueing for sequential processing...",
          );

          await Future.delayed(Duration(seconds: 2));
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onRequest: QueuedInterceptor2 - Sequential processing completed, calling next()",
          );
          handler.next(request);
        },
        onResponse: (response, handler) async {
          final requestId = response.requestOptions.extra["requestId"] ?? "N/A";
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onResponse: QueuedInterceptor2 - Entered, queueing for sequential processing...",
          );
          await Future.delayed(Duration(seconds: 2));
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onResponse: QueuedInterceptor2 - Sequential processing completed, calling next()",
          );
          handler.next(response);
        },
        onError: (error, handler) async {
          final requestId = error.requestOptions.extra["requestId"] ?? "N/A";
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onError: QueuedInterceptor2 - Entered, queueing for sequential processing...",
          );
          await Future.delayed(Duration(seconds: 2));
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onError: QueuedInterceptor2 - Sequential processing completed, calling next()",
          );
          handler.next(error);
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          final requestId = request.extra["requestId"] ?? "N/A";
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onRequest: Interceptor3 - Entered",
          );

          request.queryParameters["lan"] = "en";
          request.queryParameters["units"] = "metric";
          request.queryParameters["appid"] = _openWeatherApiKey;
          handler.next(request);
        },
        onResponse: (response, handler) {
          final requestId = response.requestOptions.extra["requestId"] ?? "N/A";
          debugPrint(
            "${DateTime.now().ssMMM} [$requestId] onResponse: Interceptor3 - Entered",
          );
          handler.next(response);
        },
      ),
    );
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          final requestId = error.requestOptions.extra["requestId"] ?? "N/A";
          var scaffoldMessenger = scaffoldMessengerKey.currentState;
          if (scaffoldMessenger != null && scaffoldMessenger.mounted == true) {
            var snackbarResult = scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text(
                  "${DateTime.now().ssMMM} [$requestId] Network error!",
                ),
                action: SnackBarAction(label: 'RETRY', onPressed: () {}),
                duration: Duration(seconds: 10),
              ),
            );
            var reason = await snackbarResult.closed;
            if (reason == SnackBarClosedReason.action) {
              handler.resolve(await _dio.requestOption(error.requestOptions));
              return;
            }
          }
          handler.next(error);
        },
      ),
    );
  }

  Future<OWCitiesFindResponse> getOWCities({String? requestId}) async {
    var response = await _dio.get(
      "find",
      queryParameters: {"lat": 25.276987, "lon": 55.296249, "cnt": 15},
      options: Options(extra: {"requestId": requestId ?? "UNKNOWN"}),
    );
    return OWCitiesFindResponse.fromJson(response.data);
  }
}

extension _DioRequestOption on Dio {
  Future<Response<T>> requestOption<T>(RequestOptions requestOptions) {
    return request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      options: Options(
        method: requestOptions.method,
        contentType: requestOptions.contentType,
        extra: requestOptions.extra,
        followRedirects: requestOptions.followRedirects,
        headers: requestOptions.headers,
        listFormat: requestOptions.listFormat,
        maxRedirects: requestOptions.maxRedirects,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        receiveTimeout: requestOptions.receiveTimeout,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        responseType: requestOptions.responseType,
        sendTimeout: requestOptions.sendTimeout,
        validateStatus: requestOptions.validateStatus,
      ),
      queryParameters: requestOptions.queryParameters,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
    );
  }
}

extension TimestampFormatting on DateTime {
  String get ssMMM {
    return "${second.toString().padLeft(2, '0')}.${millisecond.toString().padLeft(3, '0')}";
  }
}
