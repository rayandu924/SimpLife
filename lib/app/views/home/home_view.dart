import 'package:simplife/global.dart';

class HomeView extends StatelessWidget {
  final HomeModel model;

  HomeView({required this.model});

  @override
  Widget build(BuildContext context) {
    //fetchData(); after build the home helped by the data fetched
    Map<String, Object> data = model.fetchData();

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          children: [
            Container(
              height: double.infinity, // some finite value
              width: double.infinity,
              child: custom_line_chart(
                spots: data['spots'] as List<FlSpot>,
                drawVerticalLine: true,
                bottomTitleInterval: 1,
                bottomTitleGetTitlesWidget: (value, meta) {
                  if ((data['spots'] as List<FlSpot>)
                      .any((spot) => spot.x == value)) {
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
