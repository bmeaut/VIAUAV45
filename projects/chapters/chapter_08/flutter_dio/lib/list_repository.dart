import 'package:flutter/cupertino.dart';
import 'package:flutter_dio/list_model.dart';
import 'package:flutter_dio/ow_service.dart';

class ListRepository {
  var owService = OWService();

  Future<List<WeatherCityItem>> getCities() async {
    var response = await owService.getOWCities();
    return response.list
        .map(
          (e) => WeatherCityItem(
            e.id,
            e.name,
            NetworkImage(
              "https://openweathermap.org/img/wn/${e.weather[0].icon}.png",
            ),
            e.main.temp_min,
            e.main.temp,
            e.main.temp_max,
            e.wind.deg,
            e.wind.speed,
          ),
        )
        .toList();
  }
}
