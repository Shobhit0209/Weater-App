//import 'dart:math';

class WeatherDataHourly {
  List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});
  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly:
              List<Hourly>.from(json['hourly'].map((e) => Hourly.fromJson(e))));
}

class Hourly {
  int? dt;
  int? temp;
  List<Weather2>? weather;

  Hourly({this.dt, this.temp, this.weather});

  Hourly.fromJson(Map<String, dynamic> json) {
    if (json["dt"] is int) {
      dt = json["dt"];
    }
    if (json["temp"] is num) {
      temp = (json['temp'] as num?)?.round();
    }

    if (json["weather"] is List) {
      weather = json["weather"] == null
          ? null
          : (json["weather"] as List).map((e) => Weather2.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["dt"] = dt;
    data["temp"] = temp;

    if (weather != null) {
      data["weather"] = weather?.map((e) => e.toJson()).toList();
    }

    return data;
  }
}

class Weather2 {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather2({this.id, this.main, this.description, this.icon});

  Weather2.fromJson(Map<String, dynamic> json) {
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
