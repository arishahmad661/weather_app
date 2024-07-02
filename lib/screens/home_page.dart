import 'package:flutter/material.dart';
import 'package:weather/screens/weather_report/weather_report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController cityName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Discover The Weather In Your City", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32), textAlign: TextAlign.center,),
                  const SizedBox(height: 16,),
                  const Image(image: AssetImage("assets/weather.png"), width: 300,),
                  const SizedBox(height: 16,),
                  TextField(
                    controller: cityName,
                    decoration: InputDecoration(
                        labelText: "Enter City",
                        hintText: ".....",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(onPressed: (){
                        if(cityName.text != "")
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherReport(cityName: cityName.text,)));
                        else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the loction before the search.")));
                      }, icon: const Icon(Icons.search)),
                    ),
                    onSubmitted: (value) {
                      if(cityName.text != "") {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherReport(cityName: cityName.text,)));
                      } else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter the loction before the search.")));
                    },
                  ),
                  const SizedBox(height: 16,),
                  const Text("Get to know your weather and precipitation forecast", style:TextStyle(color:Colors.black54, fontSize: 16), textAlign: TextAlign.center,),
                  const SizedBox(height: 16,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
