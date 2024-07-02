import 'package:flutter/material.dart';
import 'package:weather/services/weather_api_client.dart';
import 'package:weather/models/weather_data_model.dart';

import '../../history/history.dart';
import 'details_widget.dart';
import 'error_message.dart';

class WeatherDetails extends StatefulWidget {
  WeatherData? data;
  WeatherDetails({super.key, this.data});

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {

  late WeatherApiClient client;
  late TextEditingController newCityNameController;
  late WeatherData weatherData;
  bool errorFlag = false;
  bool progressFlag = false;

  Future<void> _refresh() async {
    try {
      WeatherData newData = await client.getCurrentWeather(weatherData.name);
      setState(() {
        weatherData = newData;
        errorFlag = false;
      });
    } catch (onError) {
      setState(() {
        errorFlag = true;
      });
    }
  }

  Future<void> _getWeather() async {
    try {
      WeatherData newData = await client.getCurrentWeather(newCityNameController.text);
      setState(() {
        weatherData = newData;
        errorFlag = false;
      });
    } catch (onError) {
      setState(() {
        errorFlag = true;
      });
    } finally {
      setState(() {
        progressFlag = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    client = WeatherApiClient();
    newCityNameController = TextEditingController();
    if(widget.data == null){
      setState(() {
        errorFlag = true;
      });
    }
    else weatherData = widget.data!;
  }

  @override
  void dispose() {
    newCityNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(progressFlag) {
      return Center(child: CircularProgressIndicator(),);
    } else {
      return RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onSubmitted: (value)async {
                    if(newCityNameController.text != ""){
                      setState(() {
                        progressFlag = true;
                      });
                      _getWeather();}
                    else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the loction before the search.")));
                  },
                  controller: newCityNameController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          if(newCityNameController.text != ""){
                          setState(() {
                            progressFlag = true;
                          });
                          _getWeather();}
                        else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the loction before the search.")));

                  },
                        icon: const Icon(Icons.search),
                      ),
                      hoverColor: Colors.black,
                      border: const OutlineInputBorder(),
                      labelText: "Enter City",
                      hintText: "....."),
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage()));
                }, child: Text("Check History", style: TextStyle(color: Color.fromRGBO(145, 54, 57, 1),),)),

                if(!errorFlag) details(weatherData)

                else ErrorMessage(),
              ],
            ),
          ),
        ),
      );
    }
  }


}