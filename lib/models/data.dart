import 'package:flutter/material.dart';
import 'package:flutter_animations/models/greek_city.dart';
import 'package:flutter_animations/models/material_design.dart';

class Data {
  String flutter = "assets/flutter_logo.png";
  static String greekCity1 = "assets/greek_cities/greek_city1.jpeg";
  static String greekCity2 = "assets/greek_cities/greek_city2.jpeg";
  static String greekCity3 = "assets/greek_cities/greek_city3.jpeg";
  static String greekCity4 = "assets/greek_cities/greek_city4.jpeg";

  pusher(BuildContext context, String title, Widget destination) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MyScaffold(
        title: title,
        destination: destination,
      );
    }));
  }

  List<GreekCity> cities = [
    GreekCity(
      name: 'Athenes', 
      image: greekCity1, 
      description: 'Athènes, capitale actuelle de la Grèce'),
    GreekCity(
      name: 'Santorin', 
      image: greekCity2, 
      description: 'Santorin, capitale actuelle de la Grèce'),
    GreekCity(
      name: 'Meteores', 
      image: greekCity3, 
      description: 'Meteores, capitale actuelle de la Grèce'),
    GreekCity(
      name: 'Sounion', 
      image: greekCity4, 
      description: 'Athènes, capitale actuelle de la Grèce'),
  ]; 
}
