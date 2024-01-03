import '../services/weather.dart';
import 'package:clima/screen/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
final String apiKey = '8c59b60875851b02c637fa58122f8981';
final String url = "https://home.openweathermap.org/data/2.5/weather";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
double latitude = 0.0;
double longitude=0.0;

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
    getLocationData();
  }
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
//https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=daily&appid=$apiKey