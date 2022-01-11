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
  late double max;

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
    max = size.width - 20;

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
      case TransitionType.positioned:
        return positioned();
      case TransitionType.rotation:
        return rotation();
      case TransitionType.scale:
        return scale();
      case TransitionType.size:
        return size();
      case TransitionType.slide:
        return slide();
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
          CurvedAnimation(parent: _animationController, curve: Curves.easeIn)),
    );
  }

  Widget positioned() {
    return Stack(
      children: <Widget>[
        PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromLTRB(0, 0, 0, 0),
              end: RelativeRect.fromLTRB(max, max, max, max),
            ).animate(CurvedAnimation(
                parent: _animationController, curve: Curves.slowMiddle)),
            child: Container(
              color: Colors.orange,
            )),
        PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromLTRB(0, 0, 0, 0),
              end: RelativeRect.fromLTRB(200, 250, 0, 0),
            ).animate(_curvedAnimation),
            child: _image)
      ],
    );
  }

  RotationTransition rotation() {
    return RotationTransition(
      turns: Tween<double>(begin: 0, end: 1).animate(_curvedAnimation),
      child: _image,
    );
  }

  ScaleTransition scale() {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.15, end: 1).animate(_curvedAnimation),
      child: _image,
    );
  }

  SizeTransition size() {
    return SizeTransition(
      child: _image,
      sizeFactor: Tween<double>(begin: 1, end: 0.2).animate(_curvedAnimation),
      axis: Axis.vertical,
    );
  }

  SlideTransition slide() {
    return SlideTransition(
        child: _image,
        position: Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 0))
            .animate(_curvedAnimation));
  }

  performTransition() {
    if (!isAnimated) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}
