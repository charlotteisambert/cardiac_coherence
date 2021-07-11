import 'package:flutter/material.dart';

class AnimationButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const AnimationButton(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: this.onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(
            shape: StadiumBorder(),
            side: BorderSide(width: 1, color: Colors.white)));
  }
}
