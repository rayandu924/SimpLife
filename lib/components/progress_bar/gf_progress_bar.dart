import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum CustomProgressType { linear, circular }

class GFProgressBar extends StatelessWidget {
  final double percentage;
  final CustomProgressType type;
  final Color backgroundColor;
  final Color progressBarColor;
  final LinearGradient? linearGradient;
  final bool animateFromLastPercentage;
  final bool reverse;
  final double? width;
  final double lineHeight;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? leading;
  final Widget? trailing;
  final MainAxisAlignment alignment;
  final Widget? child;  // The child widget

  GFProgressBar({
    required this.percentage,
    this.type = CustomProgressType.linear,
    this.backgroundColor = const Color(0xFFB8C7CB),
    this.progressBarColor = Colors.red,
    this.linearGradient,
    this.animateFromLastPercentage = false,
    this.reverse = false,
    this.width,
    this.lineHeight = 5.0,
    this.padding,
    this.margin,
    this.leading,
    this.trailing,
    this.alignment = MainAxisAlignment.start,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (type == CustomProgressType.linear) {
      return Container(
        margin: margin,
        padding: padding,
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            if (leading != null) leading!,
            Expanded(
              child: Stack(
                children: [
                  LinearPercentIndicator(
                    lineHeight: lineHeight,
                    percent: percentage,
                    backgroundColor: backgroundColor,
                    progressColor: progressBarColor,
                    linearGradient: linearGradient,
                    animateFromLastPercent: animateFromLastPercentage,
                    width: width,
                  ),
                  if (child != null) Center(child: child!), // Place the child in the center
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      );
    } else if (type == CustomProgressType.circular) {
      return CircularPercentIndicator(
        radius: width ?? 50.0,
        lineWidth: lineHeight,
        percent: percentage,
        backgroundColor: backgroundColor,
        progressColor: progressBarColor,
        linearGradient: linearGradient,
        animateFromLastPercent: animateFromLastPercentage,
        reverse: reverse,
        center: child,  // Center property for the child widget
      );
    } else {
      throw Exception('Invalid progress type');
    }
  }
}
