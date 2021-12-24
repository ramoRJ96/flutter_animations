import 'package:flutter/material.dart';
import 'package:flutter_animations/models/data.dart';

class FadeInDemo extends StatelessWidget {
  
  const FadeInDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage(
        placeholder: AssetImage(Data().flutter), 
        image: NetworkImage('https://cdn.pixabay.com/photo/2021/12/09/15/52/winter-6858401_960_720.png'),
        fadeInCurve: Curves.easeIn,
        fadeOutCurve: Curves.easeOut,
        fadeInDuration: Duration(seconds: 1),
        fadeOutDuration: Duration(seconds: 1),
      ),
    );
  }
}