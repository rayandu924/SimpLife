import '../../widgets.dart';

class lineChartBarData {
  final List<FlSpot> spots;
  final bool show;
  final Color? color;
  final Gradient? gradient;
  final double barWidth;
  final bool isCurved;
  final double curveSmoothness;
  final bool preventCurveOverShooting;
  final double preventCurveOvershootingThreshold;
  final bool isStrokeCapRound;
  final bool isStrokeJoinRound;
  final BarAreaData? belowBarData;
  final BarAreaData? aboveBarData;
  final FlDotData dotData;
  final List<int> showingIndicators;
  final List<int>? dashArray;
  final Shadow shadow;
  final bool isStepLineChart;
  final LineChartStepData lineChartStepData;

  lineChartBarData({
    this.spots = const [],
    this.show = true,
    this.color,
    this.gradient,
    this.barWidth = 4.0,
    this.isCurved = true,
    this.curveSmoothness = 0.35,
    this.preventCurveOverShooting = false,
    this.preventCurveOvershootingThreshold = 10.0,
    this.isStrokeCapRound = false,
    this.isStrokeJoinRound = false,
    this.belowBarData,
    this.aboveBarData,
    this.dotData = const FlDotData(),
    this.showingIndicators = const [],
    this.dashArray,
    this.shadow = const Shadow(color: Colors.transparent),
    this.isStepLineChart = false,
    this.lineChartStepData = const LineChartStepData(),
  });

  LineChartBarData build() {
    return LineChartBarData(
      spots: spots,
      show: show,
      color: color,
      gradient: gradient,
      barWidth: barWidth,
      isCurved: isCurved,
      curveSmoothness: curveSmoothness,
      preventCurveOverShooting: preventCurveOverShooting,
      preventCurveOvershootingThreshold: preventCurveOvershootingThreshold,
      isStrokeCapRound: isStrokeCapRound,
      isStrokeJoinRound: isStrokeJoinRound,
      belowBarData: belowBarData,
      aboveBarData: aboveBarData,
      dotData: dotData,
      showingIndicators: showingIndicators,
      dashArray: dashArray,
      shadow: shadow,
      isStepLineChart: isStepLineChart,
      lineChartStepData: lineChartStepData,
    );
  }
}
