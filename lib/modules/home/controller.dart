import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/current.dart';
import 'package:weatherapp_starter_project/services/remote/current_repository.dart';

class HomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

  RxBool checkLoading() => isLoading;
  RxDouble getLatitude() => latitude;
  RxDouble getLongitude() => longitude;

  RxString city = ''.obs;
  RxString date = ''.obs;
  RxString time = ''.obs;

  final CurrentRepository _currentRepository = CurrentRepository();

  final fetchedWeatherImage = ''.obs;
  final fetchedWeatherDescription = ''.obs;
  final fetchedWeatherTemperature = ''.obs;
  final fetchedWeatherFeelsLike = ''.obs;
  final fetchedWeatherHumidity = ''.obs;
  final fetchedWeatherWindSpeed = ''.obs;
  final fetchedWeatherCloud = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getLocation();
    await fetchCurrentWeather(latitude.value, longitude.value);
  }

  Future getLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    return await Geolocator.getCurrentPosition().then((position) {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      getAddress(latitude.value, longitude.value);
      isLoading.value = false;
    });
  }

  Future<void> getAddress(double lat, double lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    city.value = placemark[0].subLocality.toString();
    date.value = DateFormat("yMMMMd").format(DateTime.now());
    time.value = DateFormat("jm").format(DateTime.now());
  }

  Future<void> fetchCurrentWeather(double lat, double lon) async {
    try {
      Current fetchedCurrentWeather =
          await _currentRepository.fetchCurrentWeather(lat, lon);
      fetchedWeatherImage.value = fetchedCurrentWeather.weather![0].icon!;
      fetchedWeatherDescription.value =
          fetchedCurrentWeather.weather![0].description!;
      fetchedWeatherTemperature.value =
          fetchedCurrentWeather.main!.temp!.toString();
      fetchedWeatherFeelsLike.value =
          fetchedCurrentWeather.main!.feelsLike!.toString();
      fetchedWeatherHumidity.value =
          fetchedCurrentWeather.main!.humidity!.toString();
      fetchedWeatherWindSpeed.value =
          fetchedCurrentWeather.wind!.speed!.toString();
      fetchedWeatherCloud.value = fetchedCurrentWeather.clouds!.all!.toString();
    } catch (e) {
      print(e.toString());
    }
  }
}
