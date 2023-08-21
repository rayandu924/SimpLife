import '../../widgets.dart';

class presentationLineChart extends StatelessWidget {
  final List<FlSpot> spots; // Remplace children[0]
  final int numberOfYIndicators; // Remplace children[1]

  presentationLineChart({
    required this.spots,
    required this.numberOfYIndicators,
  });

  @override
  Widget build(BuildContext context) {
    double minX = spots.map((e) => e.x).reduce((a, b) => a < b ? a : b);
    double maxX = spots.map((e) => e.x).reduce((a, b) => a > b ? a : b);
    double minY = spots.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    double maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);

    double yInterval = (maxY - minY) / (numberOfYIndicators - 1);

    return lineChartBuilder(
      spots: spots,
      drawVerticalLine: true,
      leftTitleInterval: yInterval,
      horizontalInterval: yInterval,
      bottomTitleInterval: 1,
      maxX: maxX,
      maxY: maxY,
      minX: minX,
      minY: minY,
      bottomTitleGetTitlesWidget: (value, meta) {
        if (spots.any((spot) => spot.x == value)) {
          return Center(child: Text(value.toInt().toString()));
        } else {
          return Container();
        }
      },
      gridLineColor: Color.fromARGB(255, 0, 254, 51),
      lineColor: Color.fromARGB(255, 255, 255, 255),
      gridLineWidth: 4,
      leftTitleReservedSize: 37,
      bottomTitleReservedSize: 37,
    );
  }
}