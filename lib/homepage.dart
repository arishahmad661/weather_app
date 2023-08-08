import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';
import 'package:weather/weather_api_client.dart';

import 'models/weather.dart';

class HomePage extends StatefulWidget {
  String? text;
  HomePage(this.text);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();

  // This code creates an instance of the WeatherApiClient class.

  String? enter, img, desc, city_name;

  double? temp, feels_like;

  int? visibility, humidity, pressure, time;

  String? text2;
  Weather data = Weather();

  Future<void> getData(String text55) async {
    data = await client.getCurrentWeather(text55);
    city_name = data.city_name.toString();
    desc = data.desc.toString();
    temp = data.temp!;
    feels_like = data.feels_like!;
    visibility = data.visibility!;
    humidity = data.humidity!;
    pressure = data.pressure!;
    img = data.img.toString();
    time = data.time!;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
        child: Scaffold(
            floatingActionButton: Link(
                target: LinkTarget.blank,
                uri: Uri.parse(
                  "https://arishahmad.com/",
                ),
                builder: (context, followLink) => InkWell(
                    onTap: followLink,
                    child: Text(
                      "Arish Ahmad",
                      style: TextStyle(color: Colors.green),
                    ))),
            body: temp_content()));
  }

  FutureBuilder<void> temp_content() {
    return FutureBuilder(
        future: getData(widget.text!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              onChanged: (enter) {
                                text2 = enter;
                              },
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      if (text2 == "" || text2 == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: const Text(
                                              'Please enter the city.'),
                                          backgroundColor: (Colors.black12),
                                          action: SnackBarAction(
                                            label: 'dismiss',
                                            onPressed: () {},
                                          ),
                                        ));
                                      } else {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage(text2)));
                                      }
                                    },
                                    icon: const Icon(Icons.forward),
                                  ),
                                  hoverColor: Colors.black,
                                  border: const OutlineInputBorder(),
                                  labelText: "Enter City",
                                  hintText: "....."),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "City Doesn't Exist!!",
                              style: TextStyle(fontSize: 26),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: oldBody(context));
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        });
  }

  SingleChildScrollView oldBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            onChanged: (enter) {
              text2 = enter;
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    if (text2 == "" || text2 == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Please enter the city.'),
                        backgroundColor: (Colors.black12),
                        action: SnackBarAction(
                          label: 'dismiss',
                          onPressed: () {},
                        ),
                      ));
                    } else {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(text2)));
                    }
                  },
                  icon: const Icon(Icons.forward),
                ),
                hoverColor: Colors.black,
                border: const OutlineInputBorder(),
                labelText: "Enter City",
                hintText: "....."),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 3),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    topLeft: Radius.circular(6),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(6),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  city_name!,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 49),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$temp°ᶜ",
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 60,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  fit: BoxFit.fill,
                  "assets/$img.png",
                  height: 140,
                ),
                Text(
                  data.desc.toString().toUpperCase(),
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          details(),
        ]),
      ),
    );
  }

  Stack details() {
    return Stack(
      children: [
        Container(
          height: 165,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.blueGrey,
          ),
        ),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 35.0, left: 35, bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Feels Like",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$feels_like°C",
                  style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35.0, left: 35, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Humidity",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$humidity%",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35.0, left: 35, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Pressure",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$pressure mbar",
                  style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35.0, left: 35, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Visibility",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$visibility m",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
