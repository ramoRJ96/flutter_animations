import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/animated_container.dart';
import 'package:flutter_animations/animation_demo/animation_list_demo.dart';
import 'package:flutter_animations/models/data.dart';
import 'package:flutter_animations/models/material_design.dart';
import 'package:flutter_animations/models/section.dart';
import 'package:flutter_animations/pages/hero_list.dart';
import 'package:flutter_animations/pages/other_animated_list.dart';
import 'package:flutter_animations/widgets/tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Section> _sections = [
      Section(name: 'Animated container', 
      icon: Icons.score, 
      destination: AnimatedContainerDemo()),
      Section(name: 'Les autres animated', 
      icon: Icons.local_movies, 
      destination: OtherAnimatedList()),
      Section(name: 'Hero', 
      icon: Icons.flash_on, 
      destination: HeroList()),
      Section(name: 'Animated List', 
      icon: Icons.list, 
      destination: AnimationListDemo()),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Image.asset(Data().flutter,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          margin: const EdgeInsets.all(7),
        ),
        title: const Text("Les animations avec Flutter"),
      ),
      body: ListView.separated(itemBuilder: ((context, index) => Tile(section: _sections[index],)), 
        separatorBuilder: ((context, index) => const MyDivider()), 
        itemCount: _sections.length
        ),
    );
  }
}
