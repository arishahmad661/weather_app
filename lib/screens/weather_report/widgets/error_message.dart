import 'package:flutter/material.dart';

Widget ErrorMessage() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        children: [
          Image.asset("assets/error.png", width: 400,),
          Container(
            color: Color.fromRGBO(145, 54, 57, 1),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Some error occurred, Try Again!",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
