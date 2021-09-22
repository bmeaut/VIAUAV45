import 'package:dio/dio.dart';
import 'package:ny_times_most_popular/data/network/model/network_reply.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_nyt_service.g.dart';

@RestApi(baseUrl: "https://api.nytimes.com")
abstract class NytService implements NytApi {

  factory NytService() {
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
    return _NytService(_dio);
  }

  @override
  @GET("/svc/mostpopular/v2/mostviewed/all-sections/7.json")
  Future<HttpResponse<NetworkReply>> getArticles();
}