import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_innowise/src/bloc/main_state.dart';
import 'package:test_app_innowise/src/models/current_weather_model.dart';
import 'package:test_app_innowise/src/repository.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialState());

  CurrentWeatherModel currentWeather = CurrentWeatherModel();

  Future<void> getData(String city) async {
    currentWeather = await DataRepository().getCurrentWeather(city);
    emit(CurrentWeatherState());
  }

  Future<void> toCurrentWeatherScreen() async {
    emit(CurrentWeatherState());
  }

  Future<void> toForecastScreen() async {
    emit(ForecastState());
  }
}