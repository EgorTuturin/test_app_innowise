import 'package:flutter/material.dart';
import 'package:test_app_innowise/src/bloc/main_state.dart';

class MainCubitHelper {
  Widget mainWidget(MainState state) {
    switch (state.toString()) {
      case 'ForecastState':
        return const Center(
          child: CircularProgressIndicator(),
        );
      case 'CurrentWeatherState':
        return const Center(
          child: CircularProgressIndicator(),
        );
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}