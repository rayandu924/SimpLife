import 'package:flutter/material.dart';
import 'settings.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Settings settings;
  final String title;
  final IconData leadingIcon;
  final Function onLeadingIconPressed;

  MyAppBar({
    required this.settings,
    this.title = 'My App',
    this.leadingIcon = Icons.arrow_back,
    required this.onLeadingIconPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: settings.backGroundSecondaryColor,
      elevation: 0,
      centerTitle: true,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(leadingIcon),
              onPressed: () => onLeadingIconPressed(),
            )
          : null,  // null leading icon when not able to pop
      title: Text(
        title,
        style: TextStyle(
          color: settings.foreGroundSecondaryColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

