import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_innowise/src/bloc/main_cubit.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({Key? key}) : super(key: key);

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
    return Container(

    );
  }
}
