class CurrentWeatherModel {
  final double temp;
  final String cityname;
  final String state;
  final double min;
  final double max;
  final double windspeed;
  final int deg;
  final int clouds;
  final String icon;

  CurrentWeatherModel({
    required this.temp,
    required this.cityname,
    required this.min,
    required this.max,
    required this.windspeed,
    required this.deg,
    required this.clouds,
    required this.state,
    required this.icon,
  });

  factory CurrentWeatherModel.fromjson(Map<String, dynamic> jsondata) {
    return CurrentWeatherModel(
      temp: jsondata["main"]["temp"],
      cityname: jsondata["name"],
      min: jsondata["main"]["temp_min"],
      max: jsondata["main"]["temp_max"],
      windspeed: jsondata["wind"]["speed"],
      deg: jsondata["wind"]["deg"],
      clouds: jsondata["clouds"]["all"],
      state: jsondata["weather"][0]["description"],
      icon: jsondata["weather"][0]["icon"],
    );
  }
}
