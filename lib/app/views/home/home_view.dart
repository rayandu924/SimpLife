import 'package:simplife/global.dart';

class HomeView extends StatelessWidget {
  final HomeModel model;
  
  HomeView({required this.model});
  
  @override
  Widget build(BuildContext context) {
    //fetchData(); after build the home helped by the data fetched

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          children: [
            Text(model.title),
            ElevatedButton(
              onPressed: model.fetchData,
              child: Text('Charger les données'),
            ),
          ],
        ),
      ),
    );
  }
}
