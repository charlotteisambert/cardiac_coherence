import 'package:flutter/material.dart';

const GROWTH_PERCENTAGE = 50 / 100;

class HorizontalBar extends StatefulWidget {
  final double height;
  final double width;
  final Animation<double> animatedWidth;
  final Animation<double> controller;

  HorizontalBar({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
  })  : animatedWidth = Tween<double>(
          begin: width,
          end: 400.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.200,
              curve: Curves.ease,
            ),
          ),
        ),

        // ... Other tween definitions ...

        super(key: key);

  @override
  State<HorizontalBar> createState() => _HorizontalBarState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HorizontalBarState extends State<HorizontalBar>
    with TickerProviderStateMixin {
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      width: widget.animatedWidth.value,
      height: widget.height,
      color: Colors.purple,
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
