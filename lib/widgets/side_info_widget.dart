import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather_model.dart';

class SideInfoWidget extends StatefulWidget {
  const SideInfoWidget({super.key, required this.data});
  final CurrentWeatherModel? data;
  @override
  State<SideInfoWidget> createState() => _SideInfoWidgetState();
}

class _SideInfoWidgetState extends State<SideInfoWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      return const CircularProgressIndicator();
    }
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const Text(
                'wind speed',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.data!.windspeed.toString()),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text(
                'degree',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.data!.deg.toString()),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text(
                'clouds',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.data!.clouds.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
