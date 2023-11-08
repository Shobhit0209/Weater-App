import 'dart:convert';
import 'package:weatherapp_starter_project/api/weather_api.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/models/weather_data_daily.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';

class FetchWeatherApi {
  WeatherData? weatherData;
  //processing data from response to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiurl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}

String apiurl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=minutely&appid=$apikey&units=metric";
  return url;
}
