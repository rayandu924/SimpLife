import 'package:flutter/material.dart';
import 'mySectionCard.dart';

class Settings {
  Color backGroundPrimaryColor;
  Color backGroundSecondaryColor;
  Color foreGroundPrimaryColor;
  Color foreGroundSecondaryColor;

  Settings({
    this.backGroundPrimaryColor = const Color.fromARGB(255, 68, 0, 255),
    this.backGroundSecondaryColor = const Color.fromARGB(255, 35, 0, 150),
    this.foreGroundPrimaryColor = const Color.fromARGB(255, 170, 0, 255),
    this.foreGroundSecondaryColor = const Color.fromARGB(255, 255, 255, 255),
  });

  //app settings to remove after

  List<IconData> icons = [
    Icons.home,
    Icons.favorite,
    Icons.settings,
  ];

  // Create a method to generate a page based on the settings.
Widget getPage(int index) {
  switch (index) {
    case 0:
      return Scaffold(
        body: Container(
          width: 100.0,   // width of the Container
          height: 100.0,  // height of the Container
          color: Colors.red,  // This will be the background color
        ),
      );
    case 1:
      return Scaffold(
        body: Center(child: Text('Page 1', style: TextStyle(color: Colors.white, fontSize: 30))),
      );
    case 2:
      return Scaffold(
        body: Center(child: Text('Page 2', style: TextStyle(color: Colors.white, fontSize: 30))),
      );
    case 3:
      return Scaffold(
        body: Center(child: Text('Page 3', style: TextStyle(color: Colors.black, fontSize: 30))),
      );
    default:
      return Scaffold(
        body: Center(child: Text('Default page', style: TextStyle(color: Colors.white, fontSize: 30))),
      );
  }
}

}