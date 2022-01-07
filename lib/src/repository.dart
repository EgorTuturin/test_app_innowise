import 'package:dio/dio.dart';
import 'package:test_app_innowise/src/constants.dart';
import 'package:test_app_innowise/src/models/current_weather_model.dart';

class DataRepository {
  var request = Dio();

  Future<CurrentWeatherModel> getCurrentWeather(String city) async {
    CurrentWeatherModel currentWeather = CurrentWeatherModel();
    await request.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {'q': city, 'units': 'metric', 'appid': apiKey}).then((value) {
      if (value.statusCode == 200) {
        print(value);
        CurrentWeatherModel  currentWeather =
        CurrentWeatherModel.fromJson(value.data);
        return currentWeather;
      }
    }).catchError((e) {
      print('getCurrentWeather request failed');
      print(e);
    });
    return currentWeather;
  }
}
