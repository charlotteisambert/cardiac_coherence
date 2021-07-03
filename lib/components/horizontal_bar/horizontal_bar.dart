import 'package:flutter/material.dart';

const GROWTH_PERCENTAGE = 50 / 100;

double _getSizeByIsLarge(double _size, bool _isLarge) {
  return _isLarge ? _size + _size * GROWTH_PERCENTAGE : _size;
}

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
    return _getSizeByIsLarge(widget.width, _isLarge);
  }

  double _getHeight() {
    return _getSizeByIsLarge(widget.height, _isLarge);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _updateSize(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: _getWidth(),
        height: widget.height,
        color: Colors.blue,
      ),
    );
  }
}
