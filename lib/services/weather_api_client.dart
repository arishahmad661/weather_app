import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/services/history_client.dart';
import 'package:weather/models/weather_data_model.dart';

class WeatherApiClient{

  Future getCurrentWeather(String? location) async {
    History history = History();
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=de8100c638c6f22f05556317c3cef59c&units=metric&units=metric");
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    WeatherData data = WeatherData.fromJson(body);
    history.addToHistory(data.name.toString(), data.main!.temp!.toDouble());
    return data;
  }

}