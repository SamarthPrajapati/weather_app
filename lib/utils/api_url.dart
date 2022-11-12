import 'package:weather/api/api_key.dart';

String apiURL(var lat, var lon) {
  String url;

  url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&APPID=$apiKey&units=metric&exclude=minutely";
  return url;
}
