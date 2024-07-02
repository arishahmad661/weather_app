import 'package:flutter/material.dart';
import 'package:weather/screens/weather_report/widgets/weather_description.dart';

import '../../../models/weather_data_model.dart';

Widget details(WeatherData weatherData) {
  return SingleChildScrollView(
    child: Column(children: [
      const SizedBox(
        height: 40,
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(145, 54, 57, 1),
              border: Border.all(color: const Color.fromRGBO(37,	158,	217,1), width: 3),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                topLeft: Radius.circular(6),
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(6),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              weatherData.name!,
              style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w600,
                  fontSize: 49),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${weatherData.main?.temp}°ᶜ",
            style: const TextStyle(
                color: Color.fromRGBO(37,	158,	217,1),
                fontSize: 60,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(145, 54, 57, 1), width: 3),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              fit: BoxFit.fill,
              "assets/${weatherData.weather?[0].icon}.png",
              height: 140,
            ),
            Flexible(
              child: Text(
                weatherData.weather![0].description.toString().toUpperCase(),
                style: const TextStyle(
                    color: Color.fromRGBO(37,	158,	217,1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color : const Color.fromRGBO(37,	158,	217,1), width: 3),
          color: const Color.fromRGBO(145, 54, 57, 1),
        ),
        child: Column(
            children: [
              WeatherDescription( property: "Feels Like", data: "${weatherData.main?.feelsLike}", ),
              WeatherDescription( property: "Humidity", data: "${weatherData.main?.humidity}%", ),
              WeatherDescription( property: "Wind Speed", data: "${weatherData.wind?.speed}", ),
            ]),
      )
    ]),
  );
}

