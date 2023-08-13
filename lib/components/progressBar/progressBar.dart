import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum progressBarType { linear, circular }

class progressBar extends StatelessWidget {
  final double percentage;
  final progressBarType type;
  final Color backgroundColor;
  final Color progressBarColor;
  final LinearGradient? linearGradient;
  final bool animateFromLastPercentage;
  final bool reverse;
  final double? width;
  final double lineHeight;
  final Widget? child;

  progressBar({
    required this.percentage,
    this.type = progressBarType.linear,
    this.backgroundColor = const Color(0xFFB8C7CB),
    this.progressBarColor = Colors.red,
    this.linearGradient,
    this.animateFromLastPercentage = false,
    this.reverse = false,
    this.width,
    this.lineHeight = 5.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (type == progressBarType.linear) {
      return LinearPercentIndicator(
        lineHeight: lineHeight,
        percent: percentage,
        backgroundColor: backgroundColor,
        progressColor: progressBarColor,
        linearGradient: linearGradient,
        animateFromLastPercent: animateFromLastPercentage,
        width: width,
        center: child,
      );
    } else if (type == progressBarType.circular) {
      return CircularPercentIndicator(
        radius: width ?? 50.0,
        lineWidth: lineHeight,
        percent: percentage,
        backgroundColor: backgroundColor,
        progressColor: progressBarColor,
        linearGradient: linearGradient,
        animateFromLastPercent: animateFromLastPercentage,
        reverse: reverse,
        center: child,
      );
    } else {
      throw Exception('Invalid progress type');
    }
  }
}