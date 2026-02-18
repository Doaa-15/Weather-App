import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/home/cubit/home_cubit.dart';
import 'package:weather_app/weather_app.dart';

void main() {
  runApp(
    BlocProvider(create: (context) =>  HomeCubit(), child: const WeatherApp()),
  );
}
