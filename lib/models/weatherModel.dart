class Weather {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  Weather(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  Weather.fromJson(Map<String, dynamic> json) {
    if (json["lat"] is double) {
      lat = json["lat"];
    }
    if (json["lon"] is double) {
      lon = json["lon"];
    }
    if (json["timezone"] is String) {
      timezone = json["timezone"];
    }
    if (json["timezone_offset"] is int) {
      timezoneOffset = json["timezone_offset"];
    }
    if (json["current"] is Map) {
      current =
          json["current"] == null ? null : Current.fromJson(json["current"]);
    }
    if (json["hourly"] is List) {
      hourly = json["hourly"] == null
          ? null
          : (json["hourly"] as List).map((e) => Hourly.fromJson(e)).toList();
    }
    if (json["daily"] is List) {
      daily = json["daily"] == null
          ? null
          : (json["daily"] as List).map((e) => Daily.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lat"] = lat;
    _data["lon"] = lon;
    _data["timezone"] = timezone;
    _data["timezone_offset"] = timezoneOffset;
    if (current != null) {
      _data["current"] = current?.toJson();
    }
    if (hourly != null) {
      _data["hourly"] = hourly?.map((e) => e.toJson()).toList();
    }
    if (daily != null) {
      _data["daily"] = daily?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  String? summary;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather3>? weather;
  int? clouds;
  int? pop;
  double? uvi;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.summary,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi});

  Daily.fromJson(Map<String, dynamic> json) {
    if (json["dt"] is int) {
      dt = json["dt"];
    }
    if (json["sunrise"] is int) {
      sunrise = json["sunrise"];
    }
    if (json["sunset"] is int) {
      sunset = json["sunset"];
    }
    if (json["moonrise"] is int) {
      moonrise = json["moonrise"];
    }
    if (json["moonset"] is int) {
      moonset = json["moonset"];
    }
    if (json["moon_phase"] is double) {
      moonPhase = json["moon_phase"];
    }
    if (json["summary"] is String) {
      summary = json["summary"];
    }
    if (json["temp"] is Map) {
      temp = json["temp"] == null ? null : Temp.fromJson(json["temp"]);
    }
    if (json["feels_like"] is Map) {
      feelsLike = json["feels_like"] == null
          ? null
          : FeelsLike.fromJson(json["feels_like"]);
    }
    if (json["pressure"] is int) {
      pressure = json["pressure"];
    }
    if (json["humidity"] is int) {
      humidity = json["humidity"];
    }
    if (json["dew_point"] is double) {
      dewPoint = json["dew_point"];
    }
    if (json["wind_speed"] is double) {
      windSpeed = json["wind_speed"];
    }
    if (json["wind_deg"] is int) {
      windDeg = json["wind_deg"];
    }
    if (json["wind_gust"] is double) {
      windGust = json["wind_gust"];
    }
    if (json["weather"] is List) {
      weather = json["weather"] == null
          ? null
          : (json["weather"] as List).map((e) => Weather3.fromJson(e)).toList();
    }
    if (json["clouds"] is int) {
      clouds = json["clouds"];
    }
    if (json["pop"] is int) {
      pop = json["pop"];
    }
    if (json["uvi"] is double) {
      uvi = json["uvi"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["dt"] = dt;
    _data["sunrise"] = sunrise;
    _data["sunset"] = sunset;
    _data["moonrise"] = moonrise;
    _data["moonset"] = moonset;
    _data["moon_phase"] = moonPhase;
    _data["summary"] = summary;
    if (temp != null) {
      _data["temp"] = temp?.toJson();
    }
    if (feelsLike != null) {
      _data["feels_like"] = feelsLike?.toJson();
    }
    _data["pressure"] = pressure;
    _data["humidity"] = humidity;
    _data["dew_point"] = dewPoint;
    _data["wind_speed"] = windSpeed;
    _data["wind_deg"] = windDeg;
    _data["wind_gust"] = windGust;
    if (weather != null) {
      _data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    _data["clouds"] = clouds;
    _data["pop"] = pop;
    _data["uvi"] = uvi;
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
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    if (json["day"] is double) {
      day = json["day"];
    }
    if (json["min"] is double) {
      min = json["min"];
    }
    if (json["max"] is double) {
      max = json["max"];
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

class Hourly {
  int? dt;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  int? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather2>? weather;
  int? pop;

  Hourly(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.pop});

  Hourly.fromJson(Map<String, dynamic> json) {
    if (json["dt"] is int) {
      dt = json["dt"];
    }
    if (json["temp"] is double) {
      temp = json["temp"];
    }
    if (json["feels_like"] is double) {
      feelsLike = json["feels_like"];
    }
    if (json["pressure"] is int) {
      pressure = json["pressure"];
    }
    if (json["humidity"] is int) {
      humidity = json["humidity"];
    }
    if (json["dew_point"] is double) {
      dewPoint = json["dew_point"];
    }
    if (json["uvi"] is int) {
      uvi = json["uvi"];
    }
    if (json["clouds"] is int) {
      clouds = json["clouds"];
    }
    if (json["visibility"] is int) {
      visibility = json["visibility"];
    }
    if (json["wind_speed"] is double) {
      windSpeed = json["wind_speed"];
    }
    if (json["wind_deg"] is int) {
      windDeg = json["wind_deg"];
    }
    if (json["wind_gust"] is double) {
      windGust = json["wind_gust"];
    }
    if (json["weather"] is List) {
      weather = json["weather"] == null
          ? null
          : (json["weather"] as List).map((e) => Weather2.fromJson(e)).toList();
    }
    if (json["pop"] is int) {
      pop = json["pop"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["dt"] = dt;
    _data["temp"] = temp;
    _data["feels_like"] = feelsLike;
    _data["pressure"] = pressure;
    _data["humidity"] = humidity;
    _data["dew_point"] = dewPoint;
    _data["uvi"] = uvi;
    _data["clouds"] = clouds;
    _data["visibility"] = visibility;
    _data["wind_speed"] = windSpeed;
    _data["wind_deg"] = windDeg;
    _data["wind_gust"] = windGust;
    if (weather != null) {
      _data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    _data["pop"] = pop;
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["main"] = main;
    _data["description"] = description;
    _data["icon"] = icon;
    return _data;
  }
}

class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  int? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  int? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather1>? weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    if (json["dt"] is int) {
      dt = json["dt"];
    }
    if (json["sunrise"] is int) {
      sunrise = json["sunrise"];
    }
    if (json["sunset"] is int) {
      sunset = json["sunset"];
    }
    if (json["temp"] is int) {
      temp = (json["temp"] as num).round();
    }
    if (json["feels_like"] is double) {
      feelsLike = json["feels_like"];
    }
    if (json["pressure"] is int) {
      pressure = json["pressure"];
    }
    if (json["humidity"] is int) {
      humidity = json["humidity"];
    }
    if (json["dew_point"] is double) {
      dewPoint = json["dew_point"];
    }
    if (json["uvi"] is int) {
      uvi = json["uvi"];
    }
    if (json["clouds"] is int) {
      clouds = json["clouds"];
    }
    if (json["visibility"] is int) {
      visibility = json["visibility"];
    }
    if (json["wind_speed"] is double) {
      windSpeed = json["wind_speed"];
    }
    if (json["wind_deg"] is int) {
      windDeg = json["wind_deg"];
    }
    if (json["wind_gust"] is double) {
      windGust = json["wind_gust"];
    }
    if (json["weather"] is List) {
      weather = json["weather"] == null
          ? null
          : (json["weather"] as List).map((e) => Weather1.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["dt"] = dt;
    _data["sunrise"] = sunrise;
    _data["sunset"] = sunset;
    _data["temp"] = temp;
    _data["feels_like"] = feelsLike;
    _data["pressure"] = pressure;
    _data["humidity"] = humidity;
    _data["dew_point"] = dewPoint;
    _data["uvi"] = uvi;
    _data["clouds"] = clouds;
    _data["visibility"] = visibility;
    _data["wind_speed"] = windSpeed;
    _data["wind_deg"] = windDeg;
    _data["wind_gust"] = windGust;
    if (weather != null) {
      _data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["main"] = main;
    _data["description"] = description;
    _data["icon"] = icon;
    return _data;
  }
}
