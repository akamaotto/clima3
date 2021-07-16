import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.purple),
        ],
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF9e9e9e)),
      ),
    );
  }
}
