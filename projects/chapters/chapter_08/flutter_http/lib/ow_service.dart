import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_http/ow_json_models.dart';
import 'package:http/http.dart' as http;

const _openWeatherApiKey = "e6932dac2b4ba21c31ba22d19f4ecc56";
const _baseUrl = "api.openweathermap.org";

OWCitiesFindResponse _parseCitiesFindResponse(String message){
  return OWCitiesFindResponse.fromJson(jsonDecode(message));
}

class OWService {
  Future<OWCitiesFindResponse> getOWCities() async {
    var response = await http.get(
      Uri.https(_baseUrl, "data/2.5/find", {
        "lat": "46.92393",
        "lon": "18.09012",
        "cnt": "50",
        "lan": "hu",
        "units": "metric",
        "appid": _openWeatherApiKey,
      }),
    );
    return compute(_parseCitiesFindResponse, response.body);
  }
}
