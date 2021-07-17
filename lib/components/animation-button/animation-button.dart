import 'package:cardiac_coherence/utils/style.dart';
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
        style: TextStyle(fontSize: 15, color: Color(colors['light'])),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((_) {
          return Color(0xFFF2D7D1);
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
          // Rounded button (when the button is pressed)
          return StadiumBorder();
        }),
        side: MaterialStateProperty.resolveWith<BorderSide>((_) {
          return BorderSide(
              width: 1,
              color: Color(
                colors['light'],
              ));
        }),
      ),
    );
  }
}
