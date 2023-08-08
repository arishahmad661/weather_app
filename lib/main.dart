import 'package:flutter/material.dart';
import 'package:weather/homepage.dart';


void main(List<String> args) {
  runApp(MaterialApp(
    home: HomePage("Delhi"),
    // home: FirstPage(),
    debugShowCheckedModeBanner: false,
  ));  
}

