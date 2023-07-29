import 'package:flutter/material.dart';
import 'settings.dart';
import 'myBottomNavigationBar.dart';
import 'myAppBar.dart';

class MainPage extends StatefulWidget {
  final Settings settings;

  MainPage({required this.settings});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        settings: widget.settings,
        title: 'SimpLife',
        onLeadingIconPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(child: widget.settings.getPage(_currentIndex)),
      bottomNavigationBar: MyBottomNavigationBar(
        settings: widget.settings,
        icons: widget.settings.icons,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
