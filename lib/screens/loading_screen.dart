import 'package:weatherapp1/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp1/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'cbf936b8c477498c33ffb0fa4f544fcd';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.yellowAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
