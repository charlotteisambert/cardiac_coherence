import 'package:flutter/material.dart';

class HorizontalBar extends StatefulWidget {
  const HorizontalBar({Key? key}) : super(key: key);

  @override
  State<HorizontalBar> createState() => _HorizontalBarState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HorizontalBarState extends State<HorizontalBar>
    with TickerProviderStateMixin {
  double _width = 100.0;
  double _height = 10.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _width = _large ? 150.0 : 100.0;
      _height = _large ? 15.0 : 10.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: _width,
        height: _height,
        color: Colors.blue,
      ),
    );
  }
}
