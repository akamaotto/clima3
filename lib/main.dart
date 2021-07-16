import 'package:clima/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchweather() async {
  const String zipCode = "Abuja";
  const String apiKey = "f6a7a655eb27c30a3bac0cf4c4ea69d4";
  const String requestURL =
      "https://api.openweathermap.org/data/2.5/weather?q=$zipCode&appid=$apiKey";
  final response = await http.get(Uri.parse(requestURL));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error loading URL info");
  }
}

class WeatherInfo {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  WeatherInfo(
      {required this.location,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.weather,
      required this.humidity,
      required this.windSpeed});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        weather: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed']);
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: "Weather App",
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// test
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<WeatherInfo>? futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainWidget(
                location: snapshot.data!.location,
                temp: snapshot.data!.temp,
                tempMin: snapshot.data!.tempMin,
                tempMax: snapshot.data!.tempMax,
                weather: snapshot.data!.weather,
                humidity: snapshot.data!.humidity,
                windSpeed: snapshot.data!.windSpeed);
          } else {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
        },
      ),
    );
  }
}
