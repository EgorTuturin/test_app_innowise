import 'package:flutter/material.dart';
import 'package:test_app_innowise/src/bloc/main_state.dart';
import 'package:test_app_innowise/src/ui/screens/current_weather_screen.dart';
import 'package:test_app_innowise/src/ui/screens/forecast_screen.dart';

class MainCubitHelper {
  Widget mainWidget(MainState state) {
    switch (state.toString()) {
      case 'ForecastState':
        return const Center(
          child: ForecastScreen(),
        );
      case 'CurrentWeatherState':
        return const Center(
          child: CurrentWeatherScreen(),
        );
      default:
        return const Center(
          child: CurrentWeatherScreen(),
        );
    }
  }
}