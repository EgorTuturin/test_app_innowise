import 'package:flutter/material.dart';

@immutable
abstract class MainState {}

class InitialState extends MainState {
  @override
  String toString() => 'InitialState';
}

class CurrentWeatherState extends MainState {
  @override
  String toString() => 'CurrentWeatherState';
}

class ForecastState extends MainState {
  @override
  String toString() => 'ForecastState';
}