import 'package:flutter/material.dart';

class InstructionsAnimatedOpacity extends StatefulWidget {
  final Animation<double> opacity;
  final Widget child;

  InstructionsAnimatedOpacity({
    Key? key,
    required this.opacity,
    required this.child,
  }) : super(key: key);

  @override
  State<InstructionsAnimatedOpacity> createState() =>
      _InstructionsAnimatedOpacityState();
}

class _InstructionsAnimatedOpacityState
    extends State<InstructionsAnimatedOpacity> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: widget.opacity, child: widget.child);
  }
}
