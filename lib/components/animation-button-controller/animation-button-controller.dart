import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

class AnimationButtonController extends StatefulWidget {
  final void Function() startAnimation;
  final void Function() stopAnimation;

  AnimationButtonController({
    Key? key,
    required this.startAnimation,
    required this.stopAnimation,
  }) : super(key: key);

  _AnimationButtonControllerState createState() =>
      _AnimationButtonControllerState();
}

class _AnimationButtonControllerState extends State<AnimationButtonController> {
  bool isAnimationPlaying = false;

  void _onPressed() {
    if (isAnimationPlaying) {
      widget.stopAnimation();
      setState(() {
        isAnimationPlaying = false;
      });
    } else {
      widget.startAnimation();
      setState(() {
        isAnimationPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimationButton(
        onPressed: _onPressed, title: isAnimationPlaying ? "Stop" : "Start");
  }
}
