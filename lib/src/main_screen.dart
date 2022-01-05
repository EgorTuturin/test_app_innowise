import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_innowise/src/bloc/main_cubit.dart';
import 'package:test_app_innowise/src/bloc/main_cubit_helper.dart';
import 'package:test_app_innowise/src/bloc/main_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainCubit _mainCubit;
  late MainCubitHelper _mainCubitHelper;
  int selectedIndex = 0;

  @override
  void initState() {
    _mainCubit = BlocProvider.of<MainCubit>(context);
    _mainCubitHelper = MainCubitHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _mainCubit,
      listener: (BuildContext context, MainState state) {},
      child: BlocBuilder(
        bloc: _mainCubit,
        builder: (BuildContext context, MainState state) {
          return Scaffold(
            appBar: AppBar(
              title: const Align(
                alignment: Alignment.center,
                child: Text(
                  'jdvojnco',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: _mainCubitHelper.mainWidget(state),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              items: const [
                BottomNavigationBarItem(
                    label: 'Today', icon: Icon(Icons.wb_sunny_outlined)),
                BottomNavigationBarItem(
                    label: 'Forecast', icon: Icon(Icons.cloud)),
              ],
              onTap: (int index) {
                setState(() {
                  selectedIndex = index;
                  selectedIndex == 0
                      ? _mainCubit.toCurrentWeatherScreen()
                      : _mainCubit.toForecastScreen();
                });
              },
            ),
          );
        },
      ),
    );
  }
}
