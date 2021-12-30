import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/hero_widget.dart';
import 'package:flutter_animations/models/greek_city.dart';

class HeroDetail extends StatelessWidget {
  final HeroWidget hero;
  final GreekCity city;

  const HeroDetail({Key? key, required this.hero, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        hero,
        Text(city.description)
      ],
    );
  }
}
