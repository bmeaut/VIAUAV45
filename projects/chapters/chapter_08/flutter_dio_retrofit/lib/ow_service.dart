import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http/list_page.dart';
import 'package:flutter_http/main.dart';
import 'package:flutter_http/ow_json_models.dart';
import 'package:retrofit/retrofit.dart';

part 'ow_service.g.dart';

const _openWeatherApiKey = "e6932dac2b4ba21c31ba22d19f4ecc56";
const _baseUrl = "api.openweathermap.org";

@RestApi(baseUrl: "https://$_baseUrl/data/2.5/")
abstract class OWService{
  factory OWService(){
    var _dio = Dio();
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
    return _OWService(_dio);
  }

  @GET("find")
  Future<OWCitiesFindResponse> getOWCities({@Query("lat") num latitude = 46.92393, @Query("lon") num longitude = 18.09012, @Query("cnt") num count = 50});
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
