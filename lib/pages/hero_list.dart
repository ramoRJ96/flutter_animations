import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/hero_widget.dart';
import 'package:flutter_animations/models/data.dart';
import 'package:flutter_animations/models/greek_city.dart';
import 'package:flutter_animations/pages/hero_detail.dart';

class HeroList extends StatelessWidget {
  const HeroList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GreekCity> _cities = Data().cities;
     

    return ListView.builder(
        itemBuilder: (context, index) {
          GreekCity city = _cities[index];
          HeroWidget hero = HeroWidget(url: city.image);
          return InkWell(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(5),
                      height: 100,
                      width: 125,
                      child: hero,),
                  Text(city.name),
                ],
              ),
            ),
            onTap: () {
              Data().pusher(context, city.name, HeroDetail(hero: hero, city: city));
            },
          );
        },
        itemCount: _cities.length);
  }
}
