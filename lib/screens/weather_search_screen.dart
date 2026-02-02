
import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_search_body.dart';

class WeatherSearchScreen extends StatelessWidget {
  const WeatherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
 body: WeatherSearchBody(),

    );
  }
}