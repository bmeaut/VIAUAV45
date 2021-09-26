import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http/list_page.dart';
import 'package:flutter_http/main.dart';
import 'package:flutter_http/ow_json_models.dart';

const _openWeatherApiKey = "4ad7108150b61ce9a438c0f0545affac";
const _baseUrl = "api.openweathermap.org";

class OWService {
  var _dio = Dio();

  OWService() {
    _dio.options.baseUrl = "https://$_baseUrl/data/2.5/";
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          print("Request: 1");
          handler.next(request);
        },
        onResponse: (response, handler) {
          print("Response: 1");
          handler.next(response);
        },
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          print("Request: 2");
          handler.next(request);
        },
        onResponse: (response, handler) {
          print("Response: 2");
          handler.next(response);
        },
      ),
    );
    _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (request, handler){
            request.queryParameters["lan"] = "hu";
            request.queryParameters["units"] = "metric";
            request.queryParameters["appid"] = _openWeatherApiKey;
            handler.next(request);
          }
        )
    );
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (error, handler) async {
        var scaffoldMessenger = scaffoldMessengerKey.currentState;
        if (scaffoldMessenger != null && scaffoldMessenger.mounted == true) {
          var snackbarResult = scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text("Hálózati hiba!"),
              action: SnackBarAction(
                label: 'RETRY',
                onPressed: () {},
              ),
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
      }),
    );
  }

  Future<OWCitiesFindResponse> getOWCities() async {
    var response = await _dio.get(
      "find",
      queryParameters: {
        "lat": 46.92393,
        "lon": 18.09012,
        "cnt": 50,
      },
    );
    return OWCitiesFindResponse.fromJson(response.data);
  }
}

extension _DioRequestOption on Dio{
  Future<Response<T>> requestOption<T>(RequestOptions requestOptions){
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
