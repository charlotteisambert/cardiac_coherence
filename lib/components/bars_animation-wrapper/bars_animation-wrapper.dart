import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

class BarsAnimationWrapper extends StatefulWidget {
  @override
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 150),
          Instructions(
            controller: _controller,
          ),
          SizedBox(height: 50),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            alignment: Alignment.topCenter,
            child: HorizontalBars(
              controller: _controller.view,
            ),
          ),
        ],
      ),
    );
  }
}
