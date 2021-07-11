import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

class BarsAnimationWrapper extends StatefulWidget {
  @override
  _BarsAnimationWrapperState createState() => _BarsAnimationWrapperState();
}

class _BarsAnimationWrapperState extends State<BarsAnimationWrapper>
    with TickerProviderStateMixin {
  String instructionsTitle = "Breath in";
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        setState(() {
          instructionsTitle = 'Breath out';
        });
      } else if (status == AnimationStatus.forward) {
        setState(() {
          instructionsTitle = 'Breath in';
        });
      }
    });
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            alignment: Alignment.bottomCenter,
            child: HorizontalBars(
              controller: _controller.view,
            ),
          ),
          SizedBox(height: 100),
          Instructions(controller: _controller, title: instructionsTitle),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
