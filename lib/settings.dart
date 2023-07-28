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
    Icons.person,
  ];

  List<Widget> pages = [
    //add section card here
    Center(
      child: MySectionCard(
        title: 'Titre de la carte',
        subtitle: 'Sous-titre de la carte',
      ),
    ),
    Center(child: Text('Favorites Page')),
    Center(child: Text('Settings Page')),
    Center(child: Text('Profile Page')),
  ];
}