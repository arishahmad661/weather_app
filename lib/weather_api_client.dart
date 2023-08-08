import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/weather.dart';

class WeatherApiClient{
  Future getCurrentWeather(String? location) async{
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=de8100c638c6f22f05556317c3cef59c&units=metric&units=metric");
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    return Weather.fronJson(body);
  }
}