// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ow_json_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OWCitiesFindResponse _$OWCitiesFindResponseFromJson(
        Map<String, dynamic> json) =>
    OWCitiesFindResponse(
      json['message'] as String,
      json['cod'] as String,
      json['count'] as num,
      (json['list'] as List<dynamic>)
          .map((e) =>
              OWCityWeatherInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OWCitiesFindResponseToJson(
        OWCitiesFindResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'cod': instance.cod,
      'count': instance.count,
      'list': instance.list,
    };

OWCityWeatherInformation _$OWCityWeatherInformationFromJson(
        Map<String, dynamic> json) =>
    OWCityWeatherInformation(
      json['id'] as num,
      json['name'] as String,
      OWCoordinate.fromJson(json['coord'] as Map<String, dynamic>),
      OWMainWeatherData.fromJson(json['main'] as Map<String, dynamic>),
      json['dt'] as num,
      OWWindWeatherData.fromJson(json['wind'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) =>
              OWWeatherDescriptionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OWCityWeatherInformationToJson(
        OWCityWeatherInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coordinate,
      'main': instance.main,
      'dt': instance.dt,
      'wind': instance.wind,
      'weather': instance.weather,
    };

OWCoordinate _$OWCoordinateFromJson(Map<String, dynamic> json) => OWCoordinate(
      json['lat'] as num,
      json['lon'] as num,
    );

Map<String, dynamic> _$OWCoordinateToJson(OWCoordinate instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

OWMainWeatherData _$OWMainWeatherDataFromJson(Map<String, dynamic> json) =>
    OWMainWeatherData(
      json['temp'] as num,
      json['pressure'] as num,
      json['humidity'] as num,
      json['temp_min'] as num,
      json['temp_max'] as num,
    );

Map<String, dynamic> _$OWMainWeatherDataToJson(OWMainWeatherData instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
    };

OWWindWeatherData _$OWWindWeatherDataFromJson(Map<String, dynamic> json) =>
    OWWindWeatherData(
      json['speed'] as num,
      json['deg'] as num,
    );

Map<String, dynamic> _$OWWindWeatherDataToJson(OWWindWeatherData instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

OWWeatherDescriptionData _$OWWeatherDescriptionDataFromJson(
        Map<String, dynamic> json) =>
    OWWeatherDescriptionData(
      json['id'] as num,
      json['main'] as String,
      json['description'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$OWWeatherDescriptionDataToJson(
        OWWeatherDescriptionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
