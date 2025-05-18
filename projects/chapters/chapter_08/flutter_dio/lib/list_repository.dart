import 'package:flutter/cupertino.dart';
import 'package:flutter_dio/list_model.dart';
import 'package:flutter_dio/ow_service.dart';
import 'package:flutter_dio/ow_json_models.dart';

class ListRepository {
  var owService = OWService();

  Future<List<WeatherCityItem>> getCities() async {
    var response1 = await owService.getOWCities(requestId: "SEQ-1");
    var response2 = await owService.getOWCities(requestId: "SEQ-2");
    return (response1.list + response2.list)
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

  Future<List<WeatherCityItem>> getCitiesInParallel() async {
    // Perform two calls in parallel
    List<OWCitiesFindResponse> responses = await Future.wait([
      owService.getOWCities(requestId: "PAR-1"),
      owService.getOWCities(requestId: "PAR-2"),
    ]);

    final List<WeatherCityItem> combinedList = [];
    for (var response in responses) {
      combinedList.addAll(
        response.list
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
            .toList(),
      );
    }
    return combinedList;
  }
}
