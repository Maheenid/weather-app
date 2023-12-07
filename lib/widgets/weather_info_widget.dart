import 'package:flutter/material.dart';

class WeatherInfoWidget extends StatefulWidget {
  const WeatherInfoWidget({
    super.key,
    required this.cityName,
    required this.state,
    required this.temb,
    required this.min,
    required this.max,
    required this.icon,
  });

  final String cityName;
  final String state;
  final double temb;
  final double min;
  final double max;
  final String icon;

  @override
  State<WeatherInfoWidget> createState() => _WeatherInfoWidgetState();
}

class _WeatherInfoWidgetState extends State<WeatherInfoWidget> {
  String switchIcon() {
    if (widget.icon == '01n') {
      return 'assets/images/icons/current_icons/night.png';
    } else if (widget.icon == '02n') {
      return 'assets/images/icons/current_icons/cloudynight.png';
    } else if (widget.icon == '02n') {
      return 'assets/images/icons/current_icons/cloudynight.png';
    } else if (widget.icon == '03n') {
      return 'assets/images/icons/current_icons/cloudynight.png';
    } else if (widget.icon == '04n') {
      return 'assets/images/icons/current_icons/cloudynight.png';
    } else if (widget.icon == '09n') {
      return 'assets/images/icons/current_icons/nightrain.png';
    } else if (widget.icon == '10n') {
      return 'assets/images/icons/current_icons/nightrain.png';
    } else if (widget.icon == '11n') {
      return 'assets/images/icons/current_icons/nightthunder.png';
    } else {
      switch (widget.state.toLowerCase()) {
        case 'few clouds':
        case 'broken clouds':
        case 'scattered clouds':
        case 'smoke':
        case 'haze':
        case 'dust':
        case 'fog':
          return 'assets/images/icons/current_icons/cloudy.png';
        case 'mist':
          return '';
        case 'rain':
        case 'drizzle':
        case 'shower rain':
          return 'assets/images/icons/current_icons/rain.png';
        case 'snow':
          return 'assets/images/icons/current_icons/snow.png';
        case 'thunderstorm':
          return 'assets/images/icons/current_icons/rain.png';
        case 'clear sky':
          return 'assets/images/icons/current_icons/sunny.png';
        default:
          return 'assets/images/icons/current_icons/sunny.png';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            widget.cityName,
            style: const TextStyle(
              fontFamily: 'Nono',
              letterSpacing: 3,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          widget.state,
          style: const TextStyle(
            letterSpacing: 4,
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
        Image.asset(switchIcon(), width: 150),
        Text(
          '${widget.temb.toInt()}°',
          style: const TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 105,
            color: Colors.black,
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'max',
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
            SizedBox(
              width: 60,
            ),
            Text(
              'min',
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${widget.max}°'),
            const SizedBox(
              width: 45,
            ),
            Text('${widget.min}°'),
          ],
        ),
      ],
    );
  }
}
