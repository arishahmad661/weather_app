import 'package:flutter/material.dart';

class Weather{
  String ? city_name, img, desc;
  double ? temp, feels_like;
  int ? visibility, humidity, pressure, time ;

  Weather({
    this.city_name,
    this.temp,
    this.visibility,
    this.humidity,
    this.feels_like,
    this.pressure,
    this.img,
    this.desc,
    this.time
  });
  Weather.fronJson(Map json){
    city_name=json["name"];
    temp=json["main"]["temp"];
    visibility=json["visibility"];
    pressure=json["main"]["pressure"];
    humidity=json["main"]["humidity"];
    feels_like=json["main"]["feels_like"];
    img=json["weather"][0]["icon"];
    desc=json["weather"][0]["description"];
    time = json["timezone"];
  }
}