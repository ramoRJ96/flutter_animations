import 'package:flutter/material.dart';

class AnimatedSizeDemo extends StatefulWidget {
  const AnimatedSizeDemo({Key? key}) : super(key: key);

  @override
  _AnimatedSizeDemoState createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo> {
  bool isBig = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () {
            setState(() {
              isBig = !isBig;
            });
          },
          child: AnimatedSize(
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            child: Container(
              height: isBig ? 300 : 150,
              width: isBig ? 300 : 150,
              color: Colors.lightBlueAccent,
            ),
          )),
    );
  }
}
