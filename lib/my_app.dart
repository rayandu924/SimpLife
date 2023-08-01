import 'package:flutter/material.dart';
import 'my_custom_ui.dart';
import 'settings.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: DefaultTextStyle(
        style: TextStyle(
          color: foregroundPrimaryColor,
          fontFamily: 'San Francisco / SF Pro Text',
          fontWeight: FontWeight.bold,
        ),
        child: MyCustomUI(),
      ),
    );
  }
}
