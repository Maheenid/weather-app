import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/current_weather_model.dart';

class CurrentWeatherService {
  Future getCurrentWeather(double lat, double long) async {
    final dio = Dio();
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&units=metric&appid=ae152bb63fa74bab6910102f90825d06';
    final respons = await dio.get(url);
    final jsondata = respons.data;
    if (respons.statusCode == 200) {
      return CurrentWeatherModel.fromjson(jsondata);
    } else {
      return throw Exception('failed to load weather data');
    }
  }

  Future<Position> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
