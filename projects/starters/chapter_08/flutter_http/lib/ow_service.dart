import 'dart:convert';

import 'package:flutter_http/ow_json_models.dart';
import 'package:http/http.dart' as http;

const _openWeatherApiKey = "e6932dac2b4ba21c31ba22d19f4ecc56";
const _baseUrl = "api.openweathermap.org";

class OWService {
  /// TODO: 1. Implement OWService with the getOWCities method and parse the response.
  Future<OWCitiesFindResponse> getOWCities() async {
    throw UnimplementedError('This method is not yet implemented');
  }
}
