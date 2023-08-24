import 'package:simplife/global.dart';

class HomeView extends StatelessWidget {
  final HomeModel model;

  HomeView({required this.model});

  @override
  Widget build(BuildContext context) {
    //fetchData(); after build the home helped by the data fetched
    Map<String, Object> data = model.fetchData();
    data['spots'] = const [
      FlSpot(0, 0),
      FlSpot(1, 1),
      FlSpot(2, 1),
      FlSpot(3, 3),
      FlSpot(4, 5),
      FlSpot(5, 3),];

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          children: [
            Expanded(  // Ajout de l'Expanded ici
              child: CustomLineChart(
                spots: data['spots'] as List<FlSpot>,
                drawVerticalLine: true,
                drawHorizontalLine: true,
                bottomTitleInterval: 1,
                bottomTitleGetTitlesWidget: (value, meta) {
                  if ((data['spots'] as List<FlSpot>).any((spot) => spot.x == value)) {
                    return Center(child: Text(value.toInt().toString()));
                  } else {
                    return Container();
                  }
                },
                gridLineColor: Color.fromARGB(255, 0, 0, 0),
                lineColor: Color.fromARGB(255, 255, 0, 0),
                gridLineWidth: 2,
                leftTitleReservedSize: 37,
                bottomTitleReservedSize: 37,
              ),
            ),
          ],
        ),
      )
    );
  }
}
