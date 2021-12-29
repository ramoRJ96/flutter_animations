import 'package:flutter/material.dart';

class AnimatedTextStyleDemo extends StatefulWidget {
  const AnimatedTextStyleDemo({ Key? key }) : super(key: key);

  @override
  _AnimatedTextStyleDemoState createState() => _AnimatedTextStyleDemoState();
}

class _AnimatedTextStyleDemoState extends State<AnimatedTextStyleDemo> {

  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isFirst = !isFirst;
          });
        },
        child: AnimatedDefaultTextStyle(
        child: Text('Tap to change'), 
        style: isFirst ? firstStyle() : secondStyle(), 
        duration: Duration(milliseconds: 500)),
      ),
    );
  }
  TextStyle firstStyle() {
    return TextStyle(
      color: Colors.orange,
      fontSize: 30,
      fontWeight: FontWeight.w100,
      //fontStyle: FontStyle.italic
    );
  }
  TextStyle secondStyle() {
    return TextStyle(
      color: Colors.teal,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      //fontStyle: FontStyle.normal
    );
  }
}