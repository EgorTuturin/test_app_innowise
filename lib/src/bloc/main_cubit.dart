import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_innowise/src/bloc/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialState());

  Future<void> toCurrentWeatherScreen() async {
    emit(CurrentWeatherState());
  }

  Future<void> toForecastScreen() async {
    emit(ForecastState());
  }
}