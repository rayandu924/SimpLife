import 'package:simplife/librairies.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  HomePageModel homePageModel = HomePageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomReorderableListView(
        children: homePageModel.sections,
      ),
    );
  }
}
