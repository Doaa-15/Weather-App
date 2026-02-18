class WeatherResponse {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherResponse({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }

  Map<String, dynamic> toJson() => {
    'location': location.toJson(),
    'current': current.toJson(),
    'forecast': forecast.toJson(),
  };
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json['name'],
    region: json['region'],
    country: json['country'],
    lat: json['lat'].toDouble(),
    lon: json['lon'].toDouble(),
    tzId: json['tz_id'],
    localtimeEpoch: json['localtime_epoch'],
    localtime: json['localtime'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'region': region,
    'country': country,
    'lat': lat,
    'lon': lon,
    'tz_id': tzId,
    'localtime_epoch': localtimeEpoch,
    'localtime': localtime,
  };
}

class Current {
  final double tempC;
  final double tempF;
  final int isDay;
  final WeatherCondition condition;
  final double windKph;
  final int humidity;
  final double feelslikeC;
  final double uv;

  Current({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.feelslikeC,
    required this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    tempC: json['temp_c'].toDouble(),
    tempF: json['temp_f'].toDouble(),
    isDay: json['is_day'],
    condition: WeatherCondition.fromJson(json['condition']),
    windKph: json['wind_kph'].toDouble(),
    humidity: json['humidity'],
    feelslikeC: json['feelslike_c'].toDouble(),
    uv: json['uv'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'temp_c': tempC,
    'temp_f': tempF,
    'is_day': isDay,
    'condition': condition.toJson(),
    'wind_kph': windKph,
    'humidity': humidity,
    'feelslike_c': feelslikeC,
    'uv': uv,
  };
}

class WeatherCondition {
  final String text;
  final String icon;
  final int code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      WeatherCondition(
        text: json['text'],
        icon: json['icon'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {'text': text, 'icon': icon, 'code': code};
}

class Forecast {
  final List<ForecastDay> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: (json['forecastday'] as List)
        .map((e) => ForecastDay.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'forecastday': forecastday.map((e) => e.toJson()).toList(),
  };
}

class ForecastDay {
  final String date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
    date: json['date'],
    day: Day.fromJson(json['day']),
    astro: Astro.fromJson(json['astro']),
    hour: (json['hour'] as List).map((e) => Hour.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'day': day.toJson(),
    'astro': astro.toJson(),
    'hour': hour.map((e) => e.toJson()).toList(),
  };
}

class Day {
  final double maxTempC;
  final double minTempC;
  final double avgTempC;
  final WeatherCondition condition;
  final double uv;

  Day({
    required this.maxTempC,
    required this.minTempC,
    required this.avgTempC,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxTempC: json['maxtemp_c'].toDouble(),
    minTempC: json['mintemp_c'].toDouble(),
    avgTempC: json['avgtemp_c'].toDouble(),
    condition: WeatherCondition.fromJson(json['condition']),
    uv: json['uv'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'maxtemp_c': maxTempC,
    'mintemp_c': minTempC,
    'avgtemp_c': avgTempC,
    'condition': condition.toJson(),
    'uv': uv,
  };
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonPhase;

  Astro({required this.sunrise, required this.sunset, required this.moonPhase});

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json['sunrise'],
    sunset: json['sunset'],
    moonPhase: json['moon_phase'],
  );

  Map<String, dynamic> toJson() => {
    'sunrise': sunrise,
    'sunset': sunset,
    'moon_phase': moonPhase,
  };
}

class Hour {
  final String time;
  final double tempC;
  final int isDay;
  final WeatherCondition condition;
  final double windKph;
  final int humidity;
  final double uv;

  Hour({
    required this.time,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    time: json['time'],
    tempC: json['temp_c'].toDouble(),
    isDay: json['is_day'],
    condition: WeatherCondition.fromJson(json['condition']),
    windKph: json['wind_kph'].toDouble(),
    humidity: json['humidity'],
    uv: json['uv'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'time': time,
    'temp_c': tempC,
    'is_day': isDay,
    'condition': condition.toJson(),
    'wind_kph': windKph,
    'humidity': humidity,
    'uv': uv,
  };
}
