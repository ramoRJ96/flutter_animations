import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/hero_widget.dart';
import 'package:flutter_animations/models/data.dart';
import 'package:flutter_animations/models/greek_city.dart';

class HeroList extends StatelessWidget {
  const HeroList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GreekCity> _cities = Data().cities;

    return ListView.builder(
        itemBuilder: (context, index) {
          GreekCity city = _cities[index];
          return InkWell(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(5),
                      height: 100,
                      width: 125,
                      child: HeroWidget(url: city.image)),
                  Text(city.name),
                ],
              ),
            ),
            onTap: () {
              
            },
          );
        },
        itemCount: _cities.length);
  }
}
