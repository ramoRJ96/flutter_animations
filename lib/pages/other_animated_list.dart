import 'package:flutter/material.dart';
import 'package:flutter_animations/models/material_design.dart';
import 'package:flutter_animations/models/section.dart';


class OtherAnimatedList extends StatelessWidget {
  const OtherAnimatedList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

     List<Section> _sections = [
      Section(name: 'Fade in', 
      icon: Icons.menu, 
      destination: EmptyWidget()),
      Section(name: 'Opacité', 
      icon: Icons.menu, 
      destination: EmptyWidget()),
      Section(name: 'Cross Fade', 
      icon: Icons.menu, 
      destination: EmptyWidget()),
      Section(name: 'TextStyle', 
      icon: Icons.menu, 
      destination: EmptyWidget()),
      Section(name: 'Taille', 
      icon: Icons.menu, 
      destination: EmptyWidget()),
      Section(name: 'Positionnement', 
      icon: Icons.menu, 
      destination: EmptyWidget()),
    ];

    return Container(
      
    );
  }
}