import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations/models/data.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  const AnimatedCrossFadeDemo({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool cross = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () => setState(() {
            cross = !cross;
          }),
          child: AnimatedCrossFade(
        firstChild: Image.asset(Data().flutter),
        secondChild: Text(
          "Retour à l'image",
          style: TextStyle(fontSize: 30),
        ),
        crossFadeState:
            cross ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: 1),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeInBack,
        sizeCurve: Curves.slowMiddle,
      )),
    );
  }
}
