import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_innowise/src/bloc/main_cubit.dart';
import 'package:test_app_innowise/src/ui/widgets/custom_card_list.dart';

class ForecastScreen extends StatefulWidget {
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  late MainCubit _mainCubit;

  @override
  void initState() {
    _mainCubit = BlocProvider.of<MainCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: _mainCubit.currentWeather?.list != null
          ? CustomCardList(_mainCubit.currentWeather!.list!)
          : const Center(
              child: Text('Request failed'),
            ),
    );
  }
}
