import 'package:flutter/material.dart';
import 'settings.dart';
import 'myBottomNavigationBar.dart';
import 'myAppBar.dart';
import 'basePage.dart'; // Make sure to import your BasePage class

class HomePage extends StatelessWidget {
  final Settings settings;

  HomePage({required this.settings}); 

  @override
  Widget build(BuildContext context) {
    return BasePage(
      settings: settings,
      body: Stack(
        children: [
          Container(
            color: settings.backGroundPrimaryColor,
            child: Center(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyBottomNavigationBar(settings: settings, icons: settings.icons, pages: settings.pages),
          ),
        ],
      ),
      onLeadingIconPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );
  }
}
