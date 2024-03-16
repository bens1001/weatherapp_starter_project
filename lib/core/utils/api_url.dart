import 'package:weatherapp_starter_project/core/utils/api_key.dart';

String apiURL(double lat, double lon) {
  String url;

  url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";
  return url;
}
