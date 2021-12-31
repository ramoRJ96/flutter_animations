import 'package:flutter/material.dart';
import 'package:flutter_animations/models/material_design.dart';
import 'package:flutter_animations/models/section.dart';
import 'package:flutter_animations/widgets/tile.dart';

class TransitionList extends StatelessWidget {
  const TransitionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Section> _sections = [
      Section(
          name: 'DecoratedBox',
          icon: Icons.compare_arrows,
          destination: EmptyWidget()),
      Section(
          name: 'Fade',
          icon: Icons.compare_arrows,
          destination: EmptyWidget()),
      Section(
          name: 'Positionned',
          icon: Icons.compare_arrows,
          destination: EmptyWidget()),
      Section(
          name: 'Rotation',
          icon: Icons.compare_arrows,
          destination: EmptyWidget()),
      Section(
          name: 'Scale',
          icon: Icons.compare_arrows,
          destination: EmptyWidget()),
      Section(
          name: 'Size',
          icon: Icons.compare_arrows,
          destination: EmptyWidget()),
      Section(
          name: 'Slide',
          icon: Icons.compare_arrows,
          destination: EmptyWidget()),
    ];

    return ListView.separated(
      itemBuilder: (context, index) => Tile(section: _sections[index]), 
    separatorBuilder: (context, index) => MyDivider(), 
    itemCount: _sections.length);
  }
}
