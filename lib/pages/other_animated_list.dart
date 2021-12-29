import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/animated_cross_fade.dart';
import 'package:flutter_animations/animation_demo/animated_opacity.dart';
import 'package:flutter_animations/animation_demo/animated_position.dart';
import 'package:flutter_animations/animation_demo/animated_size.dart';
import 'package:flutter_animations/animation_demo/animated_text.dart';
import 'package:flutter_animations/animation_demo/fade_in.dart';
import 'package:flutter_animations/models/material_design.dart';
import 'package:flutter_animations/models/section.dart';
import 'package:flutter_animations/widgets/tile.dart';


class OtherAnimatedList extends StatelessWidget {
  const OtherAnimatedList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

     List<Section> _sections = [
      Section(name: 'Fade in', 
      icon: Icons.menu, 
      destination: FadeInDemo()),
      Section(name: 'Opacité', 
      icon: Icons.menu, 
      destination: AnimatedOpacityDemo()),
      Section(name: 'Cross Fade', 
      icon: Icons.menu, 
      destination: AnimatedCrossFadeDemo()),
      Section(name: 'TextStyle', 
      icon: Icons.menu, 
      destination: AnimatedTextStyleDemo()),
      Section(name: 'Taille', 
      icon: Icons.menu, 
      destination: AnimatedSizeDemo()),
      Section(name: 'Positionnement', 
      icon: Icons.menu, 
      destination: AnimatedPositionDemo()),
    ];

    return ListView.separated(
      itemBuilder: (context, index) => Tile(section: _sections[index]), 
      separatorBuilder: (context, index) => MyDivider(), 
      itemCount: _sections.length
      );
  }
}