import 'package:clima/widgets/weather_tile.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget(
      {Key? key,
      required this.location,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.weather,
      required this.humidity,
      required this.windSpeed})
      : super(key: key);

  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFFF1F1F1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                location,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "${temp.toInt().toString()}°F",
                  style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 80,
                      fontWeight: FontWeight.w100),
                ),
              ),
              Text(
                "High of ${tempMax.toInt().toString()}°F, Low of ${tempMin.toInt().toString()}°F",
                style: const TextStyle(color: Color(0xFF9e9e9e)),
              )
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              WeatherTile(
                icon: Icons.thermostat_outlined,
                title: "Temperature",
                subtitle: "${temp.toInt().toString()}°F",
              ),
              WeatherTile(
                icon: Icons.filter_drama_outlined,
                title: "Weather",
                subtitle: weather.toString(),
              ),
              WeatherTile(
                icon: Icons.wb_sunny,
                title: "Humidity",
                subtitle: humidity.toString(),
              ),
              WeatherTile(
                icon: Icons.waves_outlined,
                title: "Wind Speed",
                subtitle: "${windSpeed.toInt().toString()}°MPH",
              ),
            ],
          ),
        ))
      ],
    );
  }
}
