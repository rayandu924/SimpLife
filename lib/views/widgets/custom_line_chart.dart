import 'package:simplife/global.dart';

class CustomLineChart extends StatefulWidget {
  final List<FlSpot> spots;

  // GridData attributes
  final bool showGrid;
  final Color gridLineColor;
  final double gridLineWidth;
  final bool drawHorizontalLine;
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
  final int leftTitlesNumber;

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

  // Default values
  final Widget Function(double, TitleMeta) defaultGetTitlesWidget = (value, meta) => Center(child: Text(value.toInt().toString(), style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))));

  CustomLineChart({
    required this.spots,
    this.showGrid = true,
    this.gridLineColor = const Color(0xff37434d),
    this.gridLineWidth = 50,
    this.drawHorizontalLine = true,
    this.drawVerticalLine = true,
    this.verticalInterval = 10,
    this.isCurved = true,
    this.lineColor = Colors.blue,
    this.showDotData = false,
    this.showBelowBarData = false,
    this.leftTitleShowTitles = true,
    this.leftTitleGetTitlesWidget,
    this.leftTitleReservedSize = 50,
    this.leftTitlesNumber = 4,
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
  });

  @override
  _CustomLineChartState createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  double minX = 0;
  double maxX = 0;
  double minY = 0;
  double maxY = 0;
  double horizontalInterval = 0;
  double leftTitleInterval = 0;

  @override
  void initState() {
    super.initState();
    updateLineChart();
  }

  @override
  void didUpdateWidget(covariant CustomLineChart oldWidget) {
    super.didUpdateWidget(oldWidget);
      updateLineChart();
  }

  void updateLineChart() {
    minX = widget.spots.map((e) => e.x).reduce((a, b) => a < b ? a : b);
    maxX = widget.spots.map((e) => e.x).reduce((a, b) => a > b ? a : b);
    minY = widget.spots.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    maxY = widget.spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    leftTitleInterval = (maxY - minY) / (widget.leftTitlesNumber - 1);
    horizontalInterval = leftTitleInterval;
  }

  @override
  Widget build(BuildContext context) {
    return
    LineChart(
      LineChartData(
        // Access the properties using 'widget.' prefix:
        gridData: FlGridData(
          show: widget.showGrid,
          horizontalInterval: horizontalInterval,
          verticalInterval: widget.verticalInterval,
          drawVerticalLine: widget.drawVerticalLine,
          drawHorizontalLine: widget.drawHorizontalLine,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: widget.gridLineColor,
              strokeWidth: widget.gridLineWidth,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: widget.gridLineColor,
              strokeWidth: widget.gridLineWidth,
            );
          },
        ),
        borderData: FlBorderData(
          show: widget.showBorder,
        ),
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles( sideTitles : SideTitles(
            showTitles: widget.leftTitleShowTitles,
            getTitlesWidget: widget.leftTitleGetTitlesWidget ?? widget.defaultGetTitlesWidget,
            reservedSize: widget.leftTitleReservedSize,
            interval: leftTitleInterval,
          )),
          bottomTitles:  AxisTitles( sideTitles : SideTitles(
            showTitles: widget.bottomTitleShowTitles,
            getTitlesWidget: widget.bottomTitleGetTitlesWidget ?? widget.defaultGetTitlesWidget,
            reservedSize: widget.bottomTitleReservedSize,
            interval: widget.bottomTitleInterval,
          )),
          rightTitles:  AxisTitles( sideTitles : SideTitles(
            showTitles: widget.rightTitleShowTitles,
            getTitlesWidget: widget.rightTitleGetTitlesWidget ?? widget.defaultGetTitlesWidget,
            reservedSize: widget.rightTitleReservedSize,
            interval: widget.rightTitleInterval,
          )),
          topTitles:  AxisTitles( sideTitles : SideTitles(
            showTitles: widget.topTitleShowTitles,
            getTitlesWidget: widget.topTitleGetTitlesWidget ?? widget.defaultGetTitlesWidget,
            reservedSize: widget.topTitleReservedSize,
            interval: widget.topTitleInterval,
          )),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: widget.spots,
            isCurved: widget.isCurved,
            color: widget.lineColor,
            dotData: FlDotData(show: widget.showDotData),
            belowBarData: BarAreaData(show: widget.showBelowBarData),
          ),
        ],
      ),
    );
  }
}