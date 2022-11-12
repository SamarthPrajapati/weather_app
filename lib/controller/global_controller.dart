import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/api/fetch_weather.dart';
import 'package:weather/model/weather_data.dart';

class GlobalController extends GetxController {
  //create various variables
  final RxBool _isLoading = false.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  RxBool checkloading() => _isLoading;
  RxDouble getlatitude() => _latitude;
  RxDouble getlongitude() => _longitude;

  final weatherData = WeatherData().obs;
  getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error("Location not Enabled");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location Permission Denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location Permission Denied");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then(
      (value) {
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;
        _isLoading.value = false;
        print(_longitude.value);
        print(_latitude.value);

        return FetchWeatherAPI()
            .processData(value.latitude, value.longitude)
            .then((value) {
          weatherData.value = value;
          _isLoading.value = false;
        });
      },
    );
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
