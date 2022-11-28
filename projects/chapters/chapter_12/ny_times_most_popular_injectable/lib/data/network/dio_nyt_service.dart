import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ny_times_most_popular/data/network/model/network_reply.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_nyt_service.g.dart';

@RestApi(baseUrl: "https://api.nytimes.com")
@Singleton(as: NytApi)
abstract class NytService implements NytApi {

  @factoryMethod
  factory NytService(Dio dio) = _NytService;

  @override
  @GET("/svc/mostpopular/v2/mostviewed/all-sections/7.json")
  Future<HttpResponse<NetworkReply>> getArticles();
}