import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app_innowise/src/bloc/main_cubit.dart';
import 'package:test_app_innowise/src/bloc/main_cubit_helper.dart';
import 'package:test_app_innowise/src/bloc/main_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Position? _currentPosition;
  late MainCubit _mainCubit;
  late MainCubitHelper _mainCubitHelper;
  int selectedIndex = 0;
  String? _currentAddress;

  @override
  void initState() {
    _getCurrentLocation();
    _mainCubit = BlocProvider.of<MainCubit>(context);
    _mainCubitHelper = MainCubitHelper();
    super.initState();
  }

  void _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  void _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.locality}';
      });
      await _mainCubit.getData(_currentAddress!);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _mainCubit,
      builder: (BuildContext context, MainState state) {
        return Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                selectedIndex == 0 ? 'Today' : _currentAddress!,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: _currentAddress != null && _mainCubit.currentWeather != null
                ? _mainCubitHelper.mainWidget(state, _currentAddress!)
                : const Center(child: Text('Geoposition not found')),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  label: 'Today', icon: Icon(Icons.wb_sunny_outlined)),
              BottomNavigationBarItem(
                  label: 'Forecast', icon: Icon(Icons.cloud_circle)),
            ],
            onTap: (int index) {
              selectedIndex = index;
              selectedIndex == 0
                  ? _mainCubit.toCurrentWeatherScreen()
                  : _mainCubit.toForecastScreen();
            },
          ),
        );
      },
    );
  }
}
