class WeatherDataDaily {
  List<Daily> daily;
  WeatherDataDaily({required this.daily});
  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      WeatherDataDaily(
          daily: List<Daily>.from(json['daily'].map((e) => Daily.fromJson(e))));
}

class Daily {
  int? dt;
  Temp? temp;
  List<Weather3>? weather;

  Daily({this.dt, this.temp, this.weather});

  Daily.fromJson(Map<String, dynamic> json) {
    if (json["dt"] is int) {
      dt = json["dt"];
    }

    if (json["temp"] is Map) {
      temp = json["temp"] == null ? null : Temp.fromJson(json["temp"]);
    }

    if (json["weather"] is List) {
      weather = json["weather"] == null
          ? null
          : (json["weather"] as List).map((e) => Weather3.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["dt"] = dt;

    if (temp != null) {
      _data["temp"] = temp?.toJson();
    }

    if (weather != null) {
      _data["weather"] = weather?.map((e) => e.toJson()).toList();
    }

    return _data;
  }
}

class Weather3 {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather3({this.id, this.main, this.description, this.icon});

  Weather3.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["main"] = main;
    _data["description"] = description;
    _data["icon"] = icon;
    return _data;
  }
}

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    if (json["day"] is double) {
      day = json["day"];
    }
    if (json["night"] is double) {
      night = json["night"];
    }
    if (json["eve"] is double) {
      eve = json["eve"];
    }
    if (json["morn"] is double) {
      morn = json["morn"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["day"] = day;
    _data["night"] = night;
    _data["eve"] = eve;
    _data["morn"] = morn;
    return _data;
  }
}

class Temp {
  double? day;
  int? min;
  int? max;
  double? night;
  double? eve;
  double? morn;
  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    if (json["day"] is double) {
      day = json["day"];
    }
    if (json["min"] is num) {
      min = (json["min"] as num?)?.round();
    }
    if (json["max"] is num) {
      max = (json["max"] as num?)?.round();
    }
    if (json["night"] is double) {
      night = json["night"];
    }
    if (json["eve"] is double) {
      eve = json["eve"];
    }
    if (json["morn"] is double) {
      morn = json["morn"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["day"] = day;
    _data["min"] = min;
    _data["max"] = max;
    _data["night"] = night;
    _data["eve"] = eve;
    _data["morn"] = morn;
    return _data;
  }
}
