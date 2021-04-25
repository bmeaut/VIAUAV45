import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:ny_times_most_popular/data/network/model/network_reply.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';

part 'chopper_nyt_api.chopper.dart';

@ChopperApi()
abstract class ChopperNytApi extends ChopperService implements NytApi {
  static ChopperNytApi create([ChopperClient? client]) => _$ChopperNytApi(client);

  @Get(path: "/svc/mostpopular/v2/mostviewed/all-sections/7.json")
  Future<Response<NetworkReply>> getArticles();
}
