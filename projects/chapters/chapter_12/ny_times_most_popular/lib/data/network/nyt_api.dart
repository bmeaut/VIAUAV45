import 'dart:async';

import 'package:ny_times_most_popular/data/network/model/network_reply.dart';
import 'package:retrofit/retrofit.dart';

abstract class NytApi {
  Future<HttpResponse<NetworkReply>> getArticles();
}
