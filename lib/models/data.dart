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
      description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,'
'molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium'
'optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis'),
    GreekCity(
      name: 'Santorin', 
      image: greekCity2, 
      description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,'
'molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium'
'optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis'),
    GreekCity(
      name: 'Meteores', 
      image: greekCity3, 
      description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,'
'molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium'
'optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis'),
    GreekCity(
      name: 'Sounion', 
      image: greekCity4, 
      description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,'
'molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum'
'numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium'
'optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis'),
  ]; 
}
