import 'package:flutter/material.dart';

class WeatherParameterIcon extends StatelessWidget {
  String weatherParameter;
  double width;
  double height;

  WeatherParameterIcon(this.weatherParameter, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    switch (weatherParameter) {
      case 'Rain':
        return Image.asset('assets/icons/rain.png',
            width: width, height: height, fit: BoxFit.fill);
      case 'Snow':
        return Image.asset('assets/icons/snow.png',
            width: width, height: height, fit: BoxFit.fill);
      case 'Sun':
        return Image.asset('assets/icons/sun.png',
            width: width, height: height, fit: BoxFit.fill);
      case 'Clouds':
        return Image.asset('assets/icons/cloud.png',
            width: width, height: height, fit: BoxFit.fill);
      default:
        return Image.asset('assets/icons/cloud50-50.png',
            width: width, height: height, fit: BoxFit.fill);
    }
  }
}
