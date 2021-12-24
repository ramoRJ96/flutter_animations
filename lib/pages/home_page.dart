import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/animated_container.dart';
import 'package:flutter_animations/models/data.dart';
import 'package:flutter_animations/models/material_design.dart';
import 'package:flutter_animations/models/section.dart';
import 'package:flutter_animations/pages/other_animated_list.dart';

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
    ];

    ListTile tile(BuildContext context, Section section) {
      return ListTile(
        leading: Icon(section.icon),
        title: Text(section.name),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Data().pusher(context, section.name, section.destination),
      );
    }


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
      body: ListView.separated(itemBuilder: ((context, index) => tile(context, _sections[index])), 
        separatorBuilder: ((context, index) => const MyDivider()), 
        itemCount: _sections.length
        ),
    );
  }
}
