import 'package:flutter/material.dart';

class WeatherCityItem {
  final num id;
  final String name;
  final ImageProvider iconImage;
  final num minTemp;
  final num currentTemp;
  final num maxTemp;
  final num windDegree;
  final num windMagnitude;

  WeatherCityItem(
    this.id,
    this.name,
    this.iconImage,
    this.minTemp,
    this.currentTemp,
    this.maxTemp,
    this.windDegree,
    this.windMagnitude,
  );
}
