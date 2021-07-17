import 'package:cardiac_coherence/utils/style.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityText extends StatefulWidget {
  final String title;
  final Animation<double> opacity;
  final Animation<double> scale;

  AnimatedOpacityText(
      {Key? key,
      required this.title,
      required this.opacity,
      required this.scale})
      : super(key: key);

  @override
  State<AnimatedOpacityText> createState() => _AnimatedOpacityTextState();
}

class _AnimatedOpacityTextState extends State<AnimatedOpacityText>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: widget.opacity,
        child: ScaleTransition(
            alignment: Alignment.topCenter,
            scale: widget.scale,
            child: Text(widget.title,
                style:
                    TextStyle(fontSize: 20, color: Color(colors['light'])))));
  }
}
