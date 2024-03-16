import 'package:dio/dio.dart';
import 'package:weatherapp_starter_project/core/utils/api_url.dart';
import 'package:weatherapp_starter_project/models/current.dart';

class CurrentRepository {
  final Dio _dio = Dio();

  Future<Current> fetchCurrentWeather(double lat, double lon) async {
    try {
      Response response = await _dio.get(apiURL(lat, lon));

      Current currentWeather = Current.fromJson(response.data);
      return currentWeather;
    } catch (e) {
      throw Exception('Failed to fetch current weather');
    }
  }
}
