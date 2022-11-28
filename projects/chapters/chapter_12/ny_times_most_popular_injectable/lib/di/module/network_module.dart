import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule{
  @singleton
  Dio get dio{
    final _dio = Dio();

    _dio.interceptors.add(
        InterceptorsWrapper(
            onRequest: (request, handler) {
              request.queryParameters["api-key"] = "Ow3X9MSWU65uuoO20PUewGB0LrBzb3Iz";
              handler.next(request);
            }
        )
    );
    _dio.interceptors.add(LogInterceptor());
    return _dio;
  }
}