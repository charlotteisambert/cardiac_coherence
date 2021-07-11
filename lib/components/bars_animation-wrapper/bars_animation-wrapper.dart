import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

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
        duration: const Duration(milliseconds: 5000), vsync: this);
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.repeat(reverse: true).orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _stopAnimation() async {
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 150),
        Instructions(
          controller: _controller,
        ),
        SizedBox(height: 50),
        HorizontalBars(
          controller: _controller.view,
        ),
        SizedBox(height: 50),
        AnimationButtonController(onPressed: _playAnimation)
      ],
    );
  }
}
