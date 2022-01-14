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
      children: List.generate(
          list.length,
          (i) => i != list.length - 1
              ? DateTime.parse(list[i].dtTxt).weekday == DateTime.parse(list[i + 1].dtTxt).weekday
                  ? _buildRow(list[i])
                  : Text('${DateTime.parse(list[i].dtTxt).weekday}')
              : Text('end')),
    );
  }

  Widget _buildRow(var element) {
    DateTime time = DateTime.parse(element.dtTxt);
    final makeListTile = ListTile(
      leading: WeatherParameterIcon(element.weather.first.main, 30, 30),
      title: Column(
        children: [
          Text('${time.hour.toString().padLeft(2,'0')}:${time.minute.toString().padLeft(2,'0')}'),
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
