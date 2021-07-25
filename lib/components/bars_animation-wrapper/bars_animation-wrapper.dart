import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

const int ANIMATION_DURATION = 5000;
const double HEADER_SHIFT_HEIGHT = 150;
const double SPACING = 50;

class BarsAnimationWrapper extends StatefulWidget {
  _BarsAnimationWrapperState createState() => _BarsAnimationWrapperState();
}

class _BarsAnimationWrapperState extends State<BarsAnimationWrapper>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: ANIMATION_DURATION),
        vsync: this);
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.repeat(reverse: true).orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  void _stopAnimation() {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: HEADER_SHIFT_HEIGHT),
        Instructions(
          controller: _controller,
        ),
        SizedBox(height: SPACING),
        HorizontalBars(
          controller: _controller.view,
        ),
        SizedBox(height: SPACING),
        AnimationButtonController(
            startAnimation: _playAnimation, stopAnimation: _stopAnimation)
      ],
    );
  }
}
