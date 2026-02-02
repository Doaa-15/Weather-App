import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_app_body.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeatherAppBody(),
    );
  }
}