import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

var _animatedOpacity =
    (Animation<double> controller) => TweenSequence(<TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ),
            weight: 20.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.0,
            ),
            weight: 60.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: 1.0,
              end: 0.0,
            ),
            weight: 20.0,
          ),
        ]).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              1.0,
              curve: Curves.linear,
            ),
          ),
        );

class Instructions extends StatefulWidget {
  final Animation<double> controller;
  final Animation<double> opacity;

  Instructions({Key? key, required this.controller})
      : opacity = _animatedOpacity(controller),
        super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions>
    with TickerProviderStateMixin {
  String instructionsTitle = "Breath in";

  @override
  void initState() {
    super.initState();

    widget.controller.addStatusListener((status) {
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

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacityText(
        title: instructionsTitle, opacity: widget.opacity);
  }
}
