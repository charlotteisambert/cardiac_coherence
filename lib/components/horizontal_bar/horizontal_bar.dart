import 'package:flutter/material.dart';

const GROWTH_PERCENTAGE = 50 / 100;

class HorizontalBar extends StatefulWidget {
  final double height;
  final double width;
  const HorizontalBar({required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  State<HorizontalBar> createState() => _HorizontalBarState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HorizontalBarState extends State<HorizontalBar>
    with TickerProviderStateMixin {
  bool _isLarge = false;

  void _updateSize() {
    setState(() {
      _isLarge = !_isLarge;
    });
  }

  double _getWidth() {
    return _isLarge
        ? widget.width + widget.width * GROWTH_PERCENTAGE
        : widget.width;
  }

  double _getHeight() {
    return _isLarge
        ? widget.height + widget.height * GROWTH_PERCENTAGE
        : widget.height;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: _getWidth(),
        height: _getHeight(),
        color: Colors.blue,
      ),
    );
  }
}
