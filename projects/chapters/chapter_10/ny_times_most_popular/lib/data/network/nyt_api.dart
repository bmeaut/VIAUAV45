import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:ny_times_most_popular/data/network/model/network_reply.dart';

part 'nyt_api.chopper.dart';

@ChopperApi()
abstract class NytApi extends ChopperService {
  static NytApi create([ChopperClient? client]) => _$NytApi(client);

  @Get(path: "/svc/mostpopular/v2/mostviewed/all-sections/7.json")
  Future<Response<NetworkReply>> getArticles();
}
