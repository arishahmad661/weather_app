import 'package:flutter/material.dart';

Widget WeatherDescription({required String property, required String data}) {
  return Padding(
    padding: const EdgeInsets.only(right: 35.0, left: 35, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          property,
          style: const TextStyle(
              color: Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text(
          data,
          style: const TextStyle(
              color: Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
