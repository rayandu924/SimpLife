import 'package:simplife/global.dart';

class custom_line_chart extends StatelessWidget {
  final List<FlSpot> spots;

  // GridData attributes
  final bool showGrid;
  final Color gridLineColor;
  final double gridLineWidth;
  final bool drawHorizontalLine;
  final double horizontalInterval;
  final bool drawVerticalLine;
  final double verticalInterval;

  // LineBarsData attributes
  final bool isCurved;
  final Color lineColor;
  final bool showDotData;
  final bool showBelowBarData;

  // Left TitlesData attributes
  final bool leftTitleShowTitles;
  final Widget Function(double, TitleMeta)? leftTitleGetTitlesWidget;
  final double leftTitleReservedSize;
  final double leftTitleInterval;

  // Bottom TitlesData attributes
  final bool bottomTitleShowTitles;
  final Widget Function(double, TitleMeta)? bottomTitleGetTitlesWidget;
  final double bottomTitleReservedSize;
  final double bottomTitleInterval;

  // Top TitlesData attributes
  final bool topTitleShowTitles;
  final Widget Function(double, TitleMeta)? topTitleGetTitlesWidget;
  final double topTitleReservedSize;
  final double topTitleInterval;

  // Right TitlesData attributes
  final bool rightTitleShowTitles;
  final Widget Function(double, TitleMeta)? rightTitleGetTitlesWidget;
  final double rightTitleReservedSize;
  final double rightTitleInterval;

  // BorderData attributes
  final bool showBorder;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;

  // Default values
  final Widget Function(double, TitleMeta) defaultGetTitlesWidget = (value, meta) => Center(child: Text(value.toInt().toString(), style: TextStyle(color: Colors.white)));

  custom_line_chart({
    required this.spots,
    this.showGrid = true,
    this.gridLineColor = const Color(0xff37434d),
    this.gridLineWidth = 3,
    this.drawHorizontalLine = true,
    this.horizontalInterval = 10,
    this.drawVerticalLine = false,
    this.verticalInterval = 10,
    this.isCurved = true,
    this.lineColor = Colors.blue,
    this.showDotData = false,
    this.showBelowBarData = false,
    this.leftTitleShowTitles = true,
    this.leftTitleGetTitlesWidget,
    this.leftTitleReservedSize = 50,
    this.leftTitleInterval = 10,
    this.bottomTitleShowTitles = true,
    this.bottomTitleGetTitlesWidget,
    this.bottomTitleReservedSize = 50,
    this.bottomTitleInterval = 10,
    this.topTitleShowTitles = false,
    this.topTitleGetTitlesWidget,
    this.topTitleReservedSize = 50,
    this.topTitleInterval = 10,
    this.rightTitleShowTitles = false,
    this.rightTitleGetTitlesWidget,
    this.rightTitleReservedSize = 50,
    this.rightTitleInterval = 10,
    this.showBorder = false,
    this.minX = 0,
    this.maxX = 10,
    this.minY = 0,
    this.maxY = 100,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: showGrid,
          horizontalInterval: horizontalInterval,
          verticalInterval: verticalInterval,
          drawVerticalLine: drawVerticalLine,
          drawHorizontalLine: drawHorizontalLine,
        ),
        borderData: FlBorderData(
          show: showBorder,
        ),
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles( sideTitles : SideTitles(
            showTitles: leftTitleShowTitles,
            getTitlesWidget : defaultGetTitlesWidget,
            reservedSize: leftTitleReservedSize,
            interval: leftTitleInterval,
          )),
          bottomTitles:  AxisTitles( sideTitles : SideTitles(
            showTitles: bottomTitleShowTitles,
            getTitlesWidget : defaultGetTitlesWidget,
            reservedSize: bottomTitleReservedSize,
            interval: bottomTitleInterval,
          )),
          rightTitles:  AxisTitles( sideTitles : SideTitles(
            showTitles: rightTitleShowTitles,
            getTitlesWidget : defaultGetTitlesWidget,
            reservedSize: rightTitleReservedSize,
            interval: rightTitleInterval,
          )),
          topTitles:  AxisTitles( sideTitles : SideTitles(
            showTitles: topTitleShowTitles,
            getTitlesWidget : defaultGetTitlesWidget,
            reservedSize: topTitleReservedSize,
            interval: topTitleInterval,
          )),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: isCurved,
            color: lineColor,
            dotData: FlDotData(show: showDotData),
            belowBarData: BarAreaData(show: showBelowBarData),
          ),
        ],
      ),
    );
  }
}
