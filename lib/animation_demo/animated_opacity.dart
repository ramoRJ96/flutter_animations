import 'package:flutter/material.dart';
import 'package:flutter_animations/models/data.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({Key? key}) : super(key: key);

  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children(),
    );
  }

  List<Widget> children() {
    List<Widget> c = [];
    c.add(Text("Opacité"));
    c.add(AnimatedOpacity(
        opacity: isOpacity ? 0 : 1,
        duration: Duration(milliseconds: 500),
        child: Image.asset(Data().flutter)));
    c.add(TextButton(
        onPressed: () {
          setState(() {
            isOpacity = !isOpacity;
          });
        },
        child: Text(isOpacity ? "Montrer" : "Cacher")));

    return c;
  }
}
