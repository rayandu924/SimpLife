import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter LineChart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<FlSpot> dataPoints = [FlSpot(0, 10), FlSpot(1, 50), FlSpot(2, 50), FlSpot(5, 50)]; // exemple de points

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter LineChart Demo'),
      ),
      body: Column(
        children: [
          Expanded(child: CustomLineChart(dataPoints: dataPoints, numOfIndicators: 5)),
          ElevatedButton(
            child: Text("Ajouter un point"),
            onPressed: () {
              setState(() {
                dataPoints.add(FlSpot(dataPoints.length.toDouble(), dataPoints.last.y + 10));
              });
            },
          )
        ],
      ),
    );
  }
}

class CustomLineChart extends StatelessWidget {
  final List<FlSpot> dataPoints;
  final int? numOfIndicators;

CustomLineChart({
  required this.dataPoints,
  this.numOfIndicators,
});


@override
Widget build(BuildContext context) {
  double minX = dataPoints.map((e) => e.x).reduce((a, b) => a < b ? a : b);
  double maxX = dataPoints.map((e) => e.x).reduce((a, b) => a > b ? a : b);
  double minY = dataPoints.map((e) => e.y).reduce((a, b) => a < b ? a : b);
  double maxY = dataPoints.map((e) => e.y).reduce((a, b) => a > b ? a : b);

  double yInterval = (maxY - minY) / (numOfIndicators! - 1);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: LineChart(
      LineChartData(
gridData: FlGridData(
  show: true,
  getDrawingHorizontalLine: (value) {
    return FlLine(
      color: const Color(0xff37434d),
      strokeWidth: 1,
    );
  },
  drawHorizontalLine: true,
  horizontalInterval: yInterval,
  drawVerticalLine: false,
),        titlesData: FlTitlesData(
          show: true,
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 50,
              showTitles: true,
              getTitlesWidget: (value, meta) => Center(child: Text(value.toInt().toString())),
              interval: yInterval,
            ),
          ),
bottomTitles: AxisTitles(
  sideTitles: SideTitles(
    reservedSize: 50,
    showTitles: true,
    getTitlesWidget: (value, meta) {
      if (dataPoints.any((spot) => spot.x == value)) {
        return Center(child: Text(value.toInt().toString()));
      } else {
        return Container();
      }
    },
  ),
),

  rightTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: false,  // Ceci empêchera d'afficher les titres à droite
    ),
  ),
  topTitles: AxisTitles(
    sideTitles: SideTitles(
      showTitles: false,  // Ceci empêchera d'afficher les titres en haut
    ),
  ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: dataPoints,
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          )
        ],
      ),
    ),
  );
}


}
