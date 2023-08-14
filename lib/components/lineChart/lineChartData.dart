import '../../widgets.dart';

class lineChartData {
  final List<LineChartBarData> lineBarsData;
  final List<BetweenBarsData> betweenBarsData;
  final FlTitlesData titlesData;
  final ExtraLinesData? extraLinesData;
  final LineTouchData lineTouchData;
  final List<ShowingTooltipIndicators> showingTooltipIndicators;
  final FlGridData? gridData;
  final FlBorderData? borderData;
  final RangeAnnotations? rangeAnnotations;
  final double? minX;
  final double? maxX;
  final double? baselineX;
  final double? minY;
  final double? maxY;
  final double? baselineY;
  final FlClipData? clipData;
  final Color? backgroundColor;

  lineChartData({
    this.lineBarsData = const [],
    this.betweenBarsData = const [],
    this.titlesData = const FlTitlesData(),
    this.extraLinesData = const ExtraLinesData(),
    this.lineTouchData = const LineTouchData(),
    this.showingTooltipIndicators = const [],
    this.gridData = const FlGridData(),
    this.borderData,
    this.rangeAnnotations = const RangeAnnotations(),
    this.minX,
    this.maxX,
    this.baselineX,
    this.minY,
    this.maxY,
    this.baselineY,
    this.clipData = const FlClipData.none(),
    this.backgroundColor,
  });

  LineChartData build() {
    return LineChartData(
      lineBarsData: lineBarsData,
      betweenBarsData: betweenBarsData,
      titlesData: titlesData,
      extraLinesData: extraLinesData,
      lineTouchData: lineTouchData,
      showingTooltipIndicators: showingTooltipIndicators,
      gridData: gridData,
      borderData: borderData,
      rangeAnnotations: rangeAnnotations,
      minX: minX,
      maxX: maxX,
      baselineX: baselineX,
      minY: minY,
      maxY: maxY,
      baselineY: baselineY,
      clipData: clipData,
      backgroundColor: backgroundColor,
    );
  }
}
