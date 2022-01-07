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
  late Geolocator _geolocator;
  late MainCubit _mainCubit;
  late MainCubitHelper _mainCubitHelper;
  int selectedIndex = 0;
  String? _currentAddress;

  @override
  void initState() {
    _mainCubit = BlocProvider.of<MainCubit>(context);
    _mainCubitHelper = MainCubitHelper();
    _getCurrentLocation();
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
    return BlocListener(
      bloc: _mainCubit,
      listener: (BuildContext context, MainState state) {},
      child: BlocBuilder(
        bloc: _mainCubit,
        builder: (BuildContext context, MainState state) {
          return Scaffold(
            appBar: AppBar(
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  selectedIndex == 0 ? 'Today' : 'kpkpkm',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Text(
                      'LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}'),
                  const SizedBox(height: 20),
                  if (_currentAddress != null) Text(_currentAddress!),
                  const SizedBox(height: 20),
              //    Text(_mainCubit.currentWeather.name!, style: TextStyle(color: Colors.red),),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            //_mainCubitHelper.mainWidget(state),
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
