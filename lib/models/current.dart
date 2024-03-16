import 'package:weatherapp_starter_project/models/clouds.dart';
import 'package:weatherapp_starter_project/models/sys.dart';
import 'package:weatherapp_starter_project/models/wind.dart';
import 'package:weatherapp_starter_project/models/weather.dart';

class Current {
  List<Weather>? weather;
  Data? main;
  Wind? wind;
  Clouds? clouds;
  Sys? sys;

  Current({
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.sys,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        main: json['main'] == null
            ? null
            : Data.fromJson(json['main'] as Map<String, dynamic>),
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        sys: json['sys'] == null
            ? null
            : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'weather': weather?.map((e) => e.toJson()).toList(),
        'main': main?.toJson(),
        'wind': wind?.toJson(),
        'clouds': clouds?.toJson(),
        'sys': sys?.toJson(),
      };
}

class Data {
  int? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? humidity;

  Data({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.humidity,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        tempMin: (json['temp_min'] as num?)?.toDouble(),
        tempMax: (json['temp_max'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'humidity': humidity,
      };
}
