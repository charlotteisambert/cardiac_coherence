import 'package:flutter/material.dart';

class AnimatedOpacityText extends StatefulWidget {
  final Animation<double> controller;
  final String title;
  final Animation<double> opacity;

  AnimatedOpacityText(
      {Key? key,
      required this.controller,
      required this.title,
      required this.opacity})
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
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ));
  }
}
