import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  String pathIcon;
  String current;

  WeatherIcon(this.pathIcon, this.current);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(pathIcon, height: 30, width: 30,),
      Text(current),
    ],);
  }
}
