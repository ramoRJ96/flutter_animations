import 'package:flutter/material.dart';
import 'package:flutter_animations/models/data.dart';
import 'package:flutter_animations/models/section.dart';

class Tile extends StatelessWidget {

  final Section section;

  const Tile({ Key? key, required this.section }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(section.icon),
        title: Text(section.name),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Data().pusher(context, section.name, section.destination),
      );
  }
}