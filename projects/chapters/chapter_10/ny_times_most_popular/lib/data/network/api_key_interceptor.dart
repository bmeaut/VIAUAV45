import 'dart:async';

import 'package:chopper/chopper.dart';

class ApiKeyInterceptor implements RequestInterceptor{
  @override
  FutureOr<Request> onRequest(Request request) {
    return request.copyWith(
      parameters: Map.from(request.parameters)
        ..["api-key"] = "Ow3X9MSWU65uuoO20PUewGB0LrBzb3Iz"
    );
  }
}