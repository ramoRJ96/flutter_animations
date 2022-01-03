import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_demo/animation_controller.dart';
import 'package:flutter_animations/models/material_design.dart';
import 'package:flutter_animations/models/section.dart';
import 'package:flutter_animations/models/transition_type.dart';
import 'package:flutter_animations/widgets/tile.dart';

class TransitionList extends StatelessWidget {
  const TransitionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Section> _sections = [
      Section(
          name: 'DecoratedBox',
          icon: Icons.compare_arrows,
          destination: AnimationControllerDemo(type: TransitionType.decoratedBox)),
      Section(
          name: 'Fade',
          icon: Icons.compare_arrows,
          destination: AnimationControllerDemo(type: TransitionType.fade)),
      Section(
          name: 'Positioned',
          icon: Icons.compare_arrows,
          destination: AnimationControllerDemo(type: TransitionType.positioned)),
      Section(
          name: 'Rotation',
          icon: Icons.compare_arrows,
          destination: AnimationControllerDemo(type: TransitionType.rotation)),
      Section(
          name: 'Scale',
          icon: Icons.compare_arrows,
          destination: AnimationControllerDemo(type: TransitionType.scale)),
      Section(
          name: 'Size',
          icon: Icons.compare_arrows,
          destination: AnimationControllerDemo(type: TransitionType.size)),
      Section(
          name: 'Slide',
          icon: Icons.compare_arrows,
          destination: AnimationControllerDemo(type: TransitionType.slide)),
    ];

    return ListView.separated(
      itemBuilder: (context, index) => Tile(section: _sections[index]), 
    separatorBuilder: (context, index) => MyDivider(), 
    itemCount: _sections.length);
  }
}
