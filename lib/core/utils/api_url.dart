String apiURL(double lat, double lon) {
  String url;

  url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=1e238b5066217192b083caccfa46b2f0";
  return url;
}
