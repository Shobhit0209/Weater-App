//import 'package:flutter/foundation.dart';

class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json["current"]));
}

class Current {
  int? temp;

  int? humidity;
  int? clouds;

  int? windSpeed;
  int? uvindex;
  int? feelslike;

  List<Weather1>? weather;

  Current(
      {this.temp,
      this.humidity,
      this.clouds,
      this.windSpeed,
      this.weather,
      this.uvindex,
      this.feelslike});

  Current.fromJson(Map<String, dynamic> json) {
    if (json["temp"] is num) {
      temp = (json['temp'] as num?)?.round();
    }
    if (json["uvi"] is num) {
      uvindex = (json["uvi"] as num?)?.round();
    }
    if (json["feels_like"] is num) {
      feelslike = (json["feels_like"] as num?)?.round();
    }

    if (json["humidity"] is int) {
      humidity = json["humidity"];
    }

    if (json["clouds"] is int) {
      clouds = json["clouds"];
    }

    if (json["wind_speed"] is num) {
      windSpeed = (json["wind_speed"] as num?)?.round();
    }

    if (json["weather"] is List) {
      weather = json["weather"] == null
          ? null
          : (json["weather"] as List).map((e) => Weather1.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uvi"] = uvindex;
    data["feels_like"] = feelslike;
    data["temp"] = temp;
    data["humidity"] = humidity;
    data["clouds"] = clouds;
    data["wind_speed"] = windSpeed;
    if (weather != null) {
      data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Weather1 {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather1({this.id, this.main, this.description, this.icon});

  Weather1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["main"] is String) {
      main = json["main"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["main"] = main;
    data["description"] = description;
    data["icon"] = icon;
    return data;
  }
}
