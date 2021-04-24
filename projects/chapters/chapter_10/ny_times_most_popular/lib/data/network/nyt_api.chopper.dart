// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nyt_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NytApi extends NytApi {
  _$NytApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NytApi;

  @override
  Future<Response<NetworkReply>> getArticles() {
    final $url = '/svc/mostpopular/v2/mostviewed/all-sections/7.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<NetworkReply, NetworkReply>($request);
  }
}
