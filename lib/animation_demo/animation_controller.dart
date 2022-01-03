import 'package:flutter/material.dart';
import 'package:flutter_animations/models/data.dart';
import 'package:flutter_animations/models/material_design.dart';
import 'package:flutter_animations/models/transition_type.dart';

class AnimationControllerDemo extends StatefulWidget {
  final TransitionType type;

  const AnimationControllerDemo({Key? key, required this.type})
      : super(key: key);

  @override
  _AnimationControllerDemoState createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  final Image _image = Image.asset(Data().flutter);
  late AnimationController _animationController;
  final Duration _duration = Duration(seconds: 1);
  late DecorationTween _decorationTween;
  late Animation<Decoration> _animationDecoration;
  late CurvedAnimation _curvedAnimation;
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: _duration, vsync: this);
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    setupDecoration();
  }

  setupDecoration() {
    BoxDecoration begin = BoxDecoration(
      color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(15),
    );
    BoxDecoration end = BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(500),
    );
    _decorationTween = DecorationTween(begin: begin, end: end);
    _animationDecoration = _decorationTween.animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double max = size.width - 20;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: max,
            width: max,
            child: Center(
              child: transition(),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  isAnimated = !isAnimated;
                });
                performTransition();
              },
              child: Text('Faire la transition')),
        ],
      ),
    );
  }

  Widget transition() {
    switch (widget.type) {
      case TransitionType.decoratedBox:
        return decoratedBox();
      case TransitionType.fade:
        return fade();
      default:
        return EmptyWidget();
    }
  }

  DecoratedBoxTransition decoratedBox() {
    return DecoratedBoxTransition(
      decoration: _animationDecoration,
      child: _image,
    );
  }

  FadeTransition fade() {
    return FadeTransition(
      child: _image,
      opacity: Tween<double>(begin: 1, end: 0.33).animate(
          CurvedAnimation(
            parent: _animationController, 
            curve: Curves.easeIn)),
    );
  }

  performTransition() {
    if (!isAnimated) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}
