import 'package:flutter/material.dart';
import 'package:weather/screens/weather_report/widgets/error_message.dart';
import 'package:weather/services/weather_api_client.dart';
import 'package:weather/screens/weather_report/widgets/weather_report_widget.dart';

class WeatherReport extends StatefulWidget {
  String cityName;
  WeatherReport({super.key, required this.cityName,});

  @override
  State<WeatherReport> createState() => _WeatherReportState();
}

class _WeatherReportState extends State<WeatherReport> {
  @override
  WeatherApiClient client = WeatherApiClient();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Weather Details"),),
        body: FutureBuilder(
          future: client.getCurrentWeather(widget.cityName),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
                return WeatherDetails(data: snapshot.data);
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )
    );
  }
}






