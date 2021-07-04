import 'package:cardiac_coherence/components/horizontal_bar/horizontal_bar.dart';
import 'package:flutter/material.dart';

const NUMBER_OF_BARS = 20;
const MINIMUM_BAR_HEIGHT = 5.0;
const MINIMUM_BAR_WIDTH = 10.0;

class HorizontalBars extends StatelessWidget {
  final Animation<double> controller;
  const HorizontalBars({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              ...new List<HorizontalBar>.generate(
                  NUMBER_OF_BARS,
                  (int index) => HorizontalBar(
                        height: MINIMUM_BAR_HEIGHT,
                        width: MINIMUM_BAR_WIDTH +
                            MINIMUM_BAR_WIDTH * (NUMBER_OF_BARS - index),
                        controller: controller,
                      ))
            ])));
  }
}
