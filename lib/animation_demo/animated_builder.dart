import 'package:flutter/material.dart';
import 'package:flutter_animations/models/data.dart';

class AnimatedBuilderDemo extends StatefulWidget {

  final IconData? icon;
  final String? name;

  const AnimatedBuilderDemo({Key? key, this.icon, this.name, destination}) : super(key: key);

  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Image _image = Image.asset(Data().flutter);
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();

    _scale = Tween<double>(begin: 0.1, end: 10).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        child: _image,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(scale: _scale.value, child: child,);
          // return Transform.rotate(
          //   angle: _animationController.value * 2 * math.pi,
          //   child: child,
          // );
        },
      ),
    );
  }
}
