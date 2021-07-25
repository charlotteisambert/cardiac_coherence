import 'package:cardiac_coherence/utils/style.dart';
import 'package:flutter/material.dart';

var _simpleAnimatedWidth = (double initialWidth, double animationBegin,
        double animationDuration, Animation<double> controller) =>
    Tween<double>(
      begin: initialWidth,
      end: initialWidth + 70.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          animationBegin,
          animationBegin + animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

var _animatedOpacity = (double animationBegin, double animationDuration,
        Animation<double> controller) =>
    Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          animationBegin,
          animationBegin + animationDuration,
          curve: Curves.linear,
        ),
      ),
    );

class HorizontalBar extends StatefulWidget {
  final double height;
  final double width;
  final double animationBegin;
  final double animationDuration;
  final Animation<double> animatedWidth;
  final Animation<double> opacity;
  final Animation<double> controller;

  HorizontalBar({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
    required this.animationBegin,
    required this.animationDuration,
  })  : animatedWidth = _simpleAnimatedWidth(
            width, animationBegin, animationDuration, controller),
        opacity =
            _animatedOpacity(animationBegin, animationDuration, controller),
        super(key: key);

  @override
  State<HorizontalBar> createState() => _HorizontalBarState();
}

class _HorizontalBarState extends State<HorizontalBar>
    with TickerProviderStateMixin {
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      width: widget.animatedWidth.value,
      height: widget.height,
      decoration: BoxDecoration(
        color: Color(colors['light']).withOpacity(widget.opacity.value),
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
          radius: widget.animatedWidth.value / 9,
          colors: [
            Color(0xFFEAE8E8),
            Color(colors['light']),
            Color(0xFFB3B2B2),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}
