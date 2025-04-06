import 'package:flutter/cupertino.dart';
import 'package:flutter_http/list_model.dart';

class ListRepository {
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
