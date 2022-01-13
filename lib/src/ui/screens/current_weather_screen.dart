import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:test_app_innowise/src/bloc/main_cubit.dart';
import 'package:test_app_innowise/src/ui/widgets/weather_icons.dart';
import 'package:test_app_innowise/src/ui/widgets/weather_parameter_icon.dart';

class CurrentWeatherScreen extends StatefulWidget {
  String city;

  CurrentWeatherScreen(this.city);

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  late MainCubit _mainCubit;

  @override
  void initState() {
    _mainCubit = BlocProvider.of<MainCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        WeatherParameterIcon(_mainCubit.currentWeather!.list!.first.weather!.first.main!, 100, 100),
        Text(widget.city),
        Text('${_mainCubit.currentWeather!.list?.first.main?.temp?.toStringAsFixed(0)} C '
            '| ${_mainCubit.currentWeather?.list?.first.weather?.first.main}'),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeatherIcon('assets/icons/humidity.png',
                '${_mainCubit.currentWeather?.list?.first.main?.humidity} %'),
            WeatherIcon('assets/icons/barometr.png',
                '${_mainCubit.currentWeather?.list?.first.main?.pressure} hPa'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WeatherIcon('assets/icons/wind.png',
                '${_mainCubit.currentWeather?.list?.first.wind?.speed?.toStringAsFixed(1)} km/h')
          ],
        ),
        const Divider(),
        InkWell(
          onTap: () async {
            await Share.share(
                '${widget.city}, ${_mainCubit.currentWeather!.list?.first.main?.temp?.toStringAsFixed(0)} C,'
                ' ${_mainCubit.currentWeather?.list?.first.weather?.first.main}');
          },
          child: const Text('Share', style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20)),
        ),
      ],
    );
  }
}
