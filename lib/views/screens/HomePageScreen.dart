import 'package:simplife/librairies.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste Réordonnable'),
      ),
      body: CustomReorderableListView(
        children: [
          ListTile(
            title: Text('Élément 1'),
          ),
          ListTile(
            title: Text('Élément 2'),
          ),
          ListTile(
            title: Text('Élément 3'),
          ),
          ListTile(
            title: Text('Élément 4'),
          ),
          ListTile(
            title: Text('Élément 5'),
          ),
        ],
      ),
    );
  }
}
