import 'package:flutter/material.dart';
import 'settings.dart';
import 'myBottomNavigationBar.dart';
import 'myAppBar.dart';

class BasePage extends StatelessWidget {
  final Settings settings;
  final Widget body;
  final Function onLeadingIconPressed;
  final IconData leadingIcon;
  final String title;

  BasePage({
    required this.settings,
    required this.body,
    required this.onLeadingIconPressed,
    this.leadingIcon = Icons.arrow_back,
    this.title = 'My App',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        settings: settings,
        onLeadingIconPressed: onLeadingIconPressed,
        leadingIcon: leadingIcon,
        title: title,
      ),
      body: body,
      bottomNavigationBar: MyBottomNavigationBar(settings: settings, icons: settings.icons, pages: settings.pages),
    );
  }
}
