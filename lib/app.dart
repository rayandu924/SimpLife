import 'package:flutter/material.dart';
import 'settings.dart';
import 'mainPage.dart';

class App extends StatelessWidget {
  final Settings settings;

  App({required this.settings});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpLife',
      theme: ThemeData(
        canvasColor: Colors.transparent,
      ),
      home: MainPage(settings: settings),
    );
  }
}
