import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          height: 500.0,
          alignment: Alignment.bottomCenter,
          child: HorizontalBars(
            controller: _controller.view,
          ),
        ),
      ),
    );
  }
}

class BarsAnimationWrapper extends StatefulWidget {
  @override
  _BarsAnimationWrapperState createState() => _BarsAnimationWrapperState();
}
