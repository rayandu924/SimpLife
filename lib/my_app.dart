import 'package:flutter/material.dart';
import 'my_custom_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyCustomUI(),
    );
  }
}
