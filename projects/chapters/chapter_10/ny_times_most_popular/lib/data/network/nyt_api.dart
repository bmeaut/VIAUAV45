import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:ny_times_most_popular/data/network/model/network_reply.dart';

abstract class NytApi {
  Future<Response<NetworkReply>> getArticles();
}
