import 'package:flutter/cupertino.dart';
import 'package:flutter_http/list_model.dart';
import 'package:flutter_http/ow_service.dart';

class ListRepository {
  /// TODO: 2. Implement the getCities method to fetch real data from the OpenWeather API
  /// using the [OWService] class.

  // Simulate a network call with a delay
  Future<List<WeatherCityItem>> getCities() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      WeatherCityItem(
        0,
        "Budapest",
        NetworkImage("http://openweathermap.org/img/wn/10d@2x.png"),
        0,
        10,
        20,
        135,
        5,
      ),
    ];
  }
}
