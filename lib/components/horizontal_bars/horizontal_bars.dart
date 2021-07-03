import 'package:cardiac_coherence/components/horizontal_bar/horizontal_bar.dart';
import 'package:flutter/material.dart';

class HorizontalBars extends StatelessWidget {
  const HorizontalBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              HorizontalBar(height: 20.0, width: 160.0),
              HorizontalBar(height: 15.0, width: 130.0),
              HorizontalBar(height: 10.0, width: 100.0),
            ])));
  }
}
