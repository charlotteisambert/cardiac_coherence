import 'package:flutter/material.dart';

class AnimationButtonController extends StatelessWidget {
  final void Function() onPressed;

  const AnimationButtonController({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: this.onPressed,
        child: const Text('Start',
            style: TextStyle(fontSize: 15, color: Colors.white)),
        style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            side: BorderSide(width: 1, color: Colors.white)));
  }
}
