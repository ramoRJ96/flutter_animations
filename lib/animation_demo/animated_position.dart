import 'package:flutter/material.dart';
import 'package:flutter_animations/models/data.dart';

class AnimatedPositionDemo extends StatefulWidget {
  const AnimatedPositionDemo({Key? key}) : super(key: key);

  @override
  _AnimatedPositionDemoState createState() => _AnimatedPositionDemoState();
}

class _AnimatedPositionDemoState extends State<AnimatedPositionDemo> {

  Duration duration = Duration(milliseconds: 500);
  bool isConnected = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double max = size.width * 0.8;
    double centerTop = max / 2 - 20;
    double centerBottom = max / 2 - 20;
    return Center(
      child: Container(
        height: max,
        width: max,
        padding: const EdgeInsets.all(5),
        child: Card(
          elevation: 8,
          child: InkWell(
            onTap: () {
              setState(() {
                isConnected = !isConnected;
              });
            },
            child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                child: TextField(decoration: InputDecoration(hintText: 'Entrez le mail'),), 
                left: 10,
                right: 10,
                bottom: centerTop,
                top: centerBottom,
                duration: duration),
              AnimatedPositioned(
                child: TextField(decoration: InputDecoration(hintText: 'Entrez le mot de passe'),), 
                left: 10,
                right: 10,
                bottom: isConnected ? centerTop : 10,
                top: isConnected ? centerBottom : max - 50,
                duration: duration),
              AnimatedPositioned(
                child: AnimatedContainer(
                  child: Image.asset(
                    Data().flutter,
                    fit: BoxFit.contain,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(
                      isConnected ? 0 : 50
                    )),
                  duration: duration
                ),
                top: isConnected ? 0 : 10,
                bottom: isConnected ? 0 : max - 100,
                left: isConnected ? 0 : 10,
                right: isConnected ? 0 : max - 100, 
                duration: duration
              ),
            ],
          ),),
        ),
      ),
    );
  }
}
