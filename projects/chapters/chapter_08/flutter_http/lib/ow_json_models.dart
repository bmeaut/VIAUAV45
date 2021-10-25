import 'package:json_annotation/json_annotation.dart';

part 'ow_json_models.g.dart';

@JsonSerializable()
class OWCitiesFindResponse{
  final String message;
  final dynamic cod;
  final num count;
  final List<OWCityWeatherInformation> list;

  OWCitiesFindResponse(this.message, this.cod, this.count, this.list);

  factory OWCitiesFindResponse.fromJson(Map<String, dynamic> json) => _$OWCitiesFindResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OWCitiesFindResponseToJson(this);
}

@JsonSerializable()
class OWCityWeatherInformation{
  final num id;
  final String name;
  @JsonKey(name: "coord") final OWCoordinate coordinate;
  final OWMainWeatherData main;
  final num dt;
  final OWWindWeatherData wind;
  final List<OWWeatherDescriptionData> weather;

  OWCityWeatherInformation(this.id, this.name, this.coordinate, this.main, this.dt, this.wind, this.weather);

  factory OWCityWeatherInformation.fromJson(Map<String, dynamic> json) => _$OWCityWeatherInformationFromJson(json);
  Map<String, dynamic> toJson() => _$OWCityWeatherInformationToJson(this);
}

@JsonSerializable()
class OWCoordinate{
  final num lat;
  final num lon;

  OWCoordinate(this.lat, this.lon);

  factory OWCoordinate.fromJson(Map<String, dynamic> json) => _$OWCoordinateFromJson(json);
  Map<String, dynamic> toJson() => _$OWCoordinateToJson(this);
}

@JsonSerializable()
class OWMainWeatherData{
  final num temp;
  final num pressure;
  final num humidity;
  final num temp_min;
  final num temp_max;

  OWMainWeatherData(this.temp, this.pressure, this.humidity, this.temp_min, this.temp_max);

  factory OWMainWeatherData.fromJson(Map<String, dynamic> json) => _$OWMainWeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$OWMainWeatherDataToJson(this);
}

@JsonSerializable()
class OWWindWeatherData{
  final num speed;
  final num deg;

  OWWindWeatherData(this.speed, this.deg);

  factory OWWindWeatherData.fromJson(Map<String, dynamic> json) => _$OWWindWeatherDataFromJson(json);
  Map<String, dynamic> toJson() => _$OWWindWeatherDataToJson(this);
}

@JsonSerializable()
class OWWeatherDescriptionData{
  final num id;
  final String main;
  final String description;
  final String icon;

  OWWeatherDescriptionData(this.id, this.main, this.description, this.icon);

  factory OWWeatherDescriptionData.fromJson(Map<String, dynamic> json) => _$OWWeatherDescriptionDataFromJson(json);
  Map<String, dynamic> toJson() => _$OWWeatherDescriptionDataToJson(this);
}