import 'package:cardiac_coherence/components/horizontal_bar/horizontal_bar.dart';
import 'package:flutter/material.dart';

const NUMBER_OF_BARS = 12;
const BAR_HEIGHT = 6.0;
const MINIMUM_BAR_WIDTH = 10.0;
const ONE_BAR_ANIMATION_DURATION = 0.100;
const INDEX_SHIFT = 1;
const DELAY_BETWEEN_ITERATION = 0.05;
const WHOLE_ANIMATION_DURATION = 1 - DELAY_BETWEEN_ITERATION;

class HorizontalBars extends StatelessWidget {
  final Animation<double> controller;
  const HorizontalBars({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ...new List<HorizontalBar>.generate(
                  NUMBER_OF_BARS,
                  (int index) => HorizontalBar(
                        height: BAR_HEIGHT,
                        width: MINIMUM_BAR_WIDTH +
                            MINIMUM_BAR_WIDTH * (NUMBER_OF_BARS - index),
                        animationDuration: ONE_BAR_ANIMATION_DURATION,
                        controller: controller,
                        animationBegin: DELAY_BETWEEN_ITERATION / 2 +
                            (WHOLE_ANIMATION_DURATION -
                                    ONE_BAR_ANIMATION_DURATION) *
                                (NUMBER_OF_BARS - INDEX_SHIFT - index) /
                                (NUMBER_OF_BARS - INDEX_SHIFT),
                      ))
            ]));
  }
}
