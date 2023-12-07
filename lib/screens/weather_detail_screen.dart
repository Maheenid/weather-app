import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/current_weather_model.dart';

import 'package:weather_app/services/current_weather_service.dart';

import 'package:weather_app/widgets/side_info_widget.dart';
import 'package:weather_app/widgets/weather_info_widget.dart';
import 'package:geolocator/geolocator.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({super.key});

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  CurrentWeatherModel? _currentWeather;

  final date = DateFormat('MMMMEEEEd').format(DateTime.now());

  void _getCurrentWeather() async {
    Position cityName = await CurrentWeatherService().getCurrentCity();

    try {
      final currentWeather = await CurrentWeatherService()
          .getCurrentWeather(cityName.latitude, cityName.longitude);
      setState(() {
        _currentWeather = currentWeather;
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$e'),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentWeather == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            date,
            style: const TextStyle(color: Colors.black38, fontSize: 15),
          ),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          date,
          style: const TextStyle(color: Colors.black38, fontSize: 15),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(
            flex: 1,
          ),
          WeatherInfoWidget(
            cityName: _currentWeather?.cityname ?? 'loading city...',
            temb: _currentWeather?.temp ?? 25,
            state: _currentWeather?.state ?? 'loading',
            min: _currentWeather?.min ?? 15,
            max: _currentWeather?.min ?? 30,
            icon: _currentWeather?.icon ?? 'loading...',
          ),
          const SizedBox(
            height: 150,
          ),
          SideInfoWidget(data: _currentWeather),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
