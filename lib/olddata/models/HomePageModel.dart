import 'package:simplife/global.dart';

class HomePageModel {
  List<Widget> sections = [];
  
  HomePageModel() {
    updateUserHomePage();
  }

  void updateUserHomePage() {
    updateSections();
  }

  void updateSections() {
    sections = [];
  }
}
