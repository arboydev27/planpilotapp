// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1000,
      lineHeight: 10,
      percent: 0.5,
      progressColor: Color(0xFF43C6AC),
      backgroundColor: Colors.grey,
      padding: EdgeInsets.symmetric(horizontal: 25),
    );
  }
}