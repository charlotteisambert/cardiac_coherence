import 'package:cardiac_coherence/components/animated_scale/animated_scale.dart';
import 'package:cardiac_coherence/components/instructions_animated_opacity/instructions_animated_opacity.dart';
import 'package:cardiac_coherence/utils/style.dart';
import 'package:flutter/material.dart';

const ACTIVE_TEXT_OPACITY = 1.0;
const INACTIVE_TEXT_OPACITY = 0.0;

const INITIAL_TEXT_SIZE = 1.0;
const TEXT_SIZE_INCREASE_PERCENTAGE = 0.5;
const FINAL_TEXT_SIZE =
    INITIAL_TEXT_SIZE + INITIAL_TEXT_SIZE * TEXT_SIZE_INCREASE_PERCENTAGE;

var _animatedOpacity =
    (Animation<double> controller) => TweenSequence(<TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: INACTIVE_TEXT_OPACITY,
              end: ACTIVE_TEXT_OPACITY,
            ),
            weight: 20.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: ACTIVE_TEXT_OPACITY,
              end: ACTIVE_TEXT_OPACITY,
            ),
            weight: 60.0,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(
              begin: ACTIVE_TEXT_OPACITY,
              end: INACTIVE_TEXT_OPACITY,
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

var _animatedScale = (Animation<double> controller) => Tween<double>(
      begin: INITIAL_TEXT_SIZE,
      end: FINAL_TEXT_SIZE,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.05,
          0.95,
          curve: Curves.linear,
        ),
      ),
    );

class Instructions extends StatefulWidget {
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> scale;

  Instructions({Key? key, required this.controller})
      : opacity = _animatedOpacity(controller),
        scale = _animatedScale(controller),
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
    return Container(
        child: InstructionsAnimatedOpacity(
            opacity: widget.opacity,
            child: AnimatedScale(
                scale: widget.scale,
                child: Text(instructionsTitle,
                    style: TextStyle(
                        fontSize: 20, color: Color(colors['light']))))));
  }
}
