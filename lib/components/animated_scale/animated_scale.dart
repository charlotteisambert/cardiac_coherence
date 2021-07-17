import 'package:flutter/material.dart';

class AnimatedScale extends StatefulWidget {
  final Animation<double> scale;
  final Widget child;

  AnimatedScale({Key? key, required this.child, required this.scale})
      : super(key: key);

  @override
  State<AnimatedScale> createState() => _AnimatedScaleState();
}

class _AnimatedScaleState extends State<AnimatedScale>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        alignment: Alignment.topCenter,
        scale: widget.scale,
        child: widget.child);
  }
}
