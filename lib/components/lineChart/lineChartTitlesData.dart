import '../../widgets.dart';

class lineChartTitlesData {
  final bool show;
  final AxisTitles leftTitles;
  final AxisTitles topTitles;
  final AxisTitles rightTitles;
  final AxisTitles bottomTitles;

  lineChartTitlesData({
    this.show = true,
    this.leftTitles = const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    this.topTitles = const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    this.rightTitles = const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    this.bottomTitles = const AxisTitles(sideTitles: SideTitles(showTitles: false)),
  });

  FlTitlesData build() {
    return FlTitlesData(
      show: show,
      leftTitles: leftTitles,
      topTitles: topTitles,
      rightTitles: rightTitles,
      bottomTitles: bottomTitles,
    );
  }
}
