import 'package:cardiac_coherence/components/horizontal_bar/horizontal_bar.dart';
import 'package:flutter/material.dart';

const NUMBER_OF_BARS = 12;
const MINIMUM_BAR_HEIGHT = 6.0;
const MINIMUM_BAR_WIDTH = 10.0;
const ONE_BAR_ANIMATION_DURATION = 0.100;
const WHOLE_ANIMATION_DURATION = 1;
const INDEX_SHIFT = 1;

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
                        animationDuration: ONE_BAR_ANIMATION_DURATION,
                        controller: controller,
                        animationBegin: (WHOLE_ANIMATION_DURATION -
                                ONE_BAR_ANIMATION_DURATION) *
                            (NUMBER_OF_BARS - INDEX_SHIFT - index) /
                            (NUMBER_OF_BARS - INDEX_SHIFT),
                      ))
            ])));
  }
}
