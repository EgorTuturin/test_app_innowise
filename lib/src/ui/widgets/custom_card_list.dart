import 'package:flutter/material.dart';
import 'package:test_app_innowise/src/ui/widgets/weather_parameter_icon.dart';

class CustomCardList extends StatefulWidget {
  List<dynamic> list;

  CustomCardList(this.list);

  @override
  _CustomCardListState createState() => _CustomCardListState();
}

class _CustomCardListState extends State<CustomCardList> {
  List<dynamic> get list => widget.list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(list.length, (i) => _buildRow(list[i])),
    );
  }

  Widget _buildRow(var element) {
    final makeListTile = ListTile(
      leading: WeatherParameterIcon(element.weather.first.main, 30, 30),
      title: Column(
        children: [
          Text(element.dtTxt),
          Text(element.weather.first.description),
        ],
      ),
      trailing: Text(element.main.temp.toStringAsFixed(0)),
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: makeListTile,
    );
  }
}
