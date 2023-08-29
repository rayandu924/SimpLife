import 'package:simplife/app/utils/converters/fl_spot.dart';
import 'package:simplife/global.dart';

class HomeView extends StatelessWidget {
  final HomeModel model;

  HomeView({required this.model});

  @override
  Widget build(BuildContext context) {
    //fetchData(); after build the home helped by the data fetched
    Map<String, Object> data = model.fetchData();
    List<FlSpot> spots = convertStringToFlSpots(data['spots'] as String);

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Column(
        children: [
          Expanded(
              child: CustomTileLayout(
            tile: custom_tile(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0)
            ),
            center: CustomLineChart(
                spots: spots,
                drawVerticalLine: true,
                drawHorizontalLine: true,
                bottomTitleInterval: 1,
                gridLineColor: Color.fromARGB(255, 0, 0, 0),
                lineColor: Color.fromARGB(255, 255, 0, 0),
                gridLineWidth: 2,
                leftTitleReservedSize: 37,
                bottomTitleReservedSize: 37,
              ),
            contentMargin: EdgeInsets.symmetric(vertical: 3),
          ))
        ],
      ),
    );
  }
}
