import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetchweather.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';

class GlobalController extends GetxController {
  //create various variables
  final RxBool _isloading = true.obs;
  final RxDouble lattitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  RxInt _currentindex = 0.obs;

  //create instance for them
  RxBool checkloading() => _isloading;
  RxDouble getlattitude() => lattitude;
  RxDouble getlongitude() => longitude;
  final weatherData = WeatherData().obs;

  WeatherData getweatherData() {
    return weatherData.value;
  }

  WeatherData gethourlyweather() {
    return weatherData.value;
  }

  WeatherData getdailyweather() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isloading.isTrue) {
      getLocation();
    } else {
      getindex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isserviceEnabled;
    LocationPermission locationPermission;
    isserviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isserviceEnabled) {
      return Future.error("Location Service is not enabled");
    }
    //status of permission

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location is denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //request permission

      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Please allow access to the required permissions');
      }
    }
    //getting the current position.
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update your latt. and long.

      lattitude.value = value.latitude;
      longitude.value = value.longitude;

      return FetchWeatherApi()
          .processData(value.latitude, value.longitude)
          .then((value) {
        _isloading.value = false;
        weatherData.value = value;
      });
    });
  }

  RxInt getindex() {
    return _currentindex;
  }
}
