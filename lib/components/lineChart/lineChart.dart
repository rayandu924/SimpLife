import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class lineChart extends StatelessWidget {
  final LineChartData data;
  final Key? chartRendererKey;
  final Key? key;
  final Duration duration;
  final Curve curve;

  lineChart({
    required this.data,
    this.chartRendererKey,
    this.key,
    this.duration = const Duration(milliseconds: 150),
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      data,
      chartRendererKey: chartRendererKey,
      duration: duration,
      curve: curve,
    );
  }
}
