import 'package:cardiac_coherence/components/index.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.indigo[900]),
        child: BarsAnimationWrapper());
  }
}
