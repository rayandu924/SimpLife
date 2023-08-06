import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'settings.dart';
import 'dart:ui';
import 'my_custom_widgets.dart';

class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI> with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      body: Stack(
        children: [
          MyCustomWidgets.mainPage(context, _tabController),
        ],
      ),
    );
  }
}