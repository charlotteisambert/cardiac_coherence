import 'package:cardiac_coherence/components/index.dart';
import 'package:cardiac_coherence/utils/style.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color(colors['blue'])),
        child: BarsAnimationWrapper());
  }
}
