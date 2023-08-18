import 'package:flutter/material.dart';

enum TitlePosition { above, below }

class presentationContent extends StatelessWidget {
  final Widget title;
  final Widget child;
  final TitlePosition titlePosition;
  final Alignment titleAlignment;

  presentationContent({
    required this.title,
    required this.child,
    this.titlePosition = TitlePosition.above,
    this.titleAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Align(
      alignment: titleAlignment,
      child: title,
    );

    List<Widget> children;

    if (titlePosition == TitlePosition.above) {
      children = [titleWidget, Expanded(child: child)];
    } else {
      children = [Expanded(child: child), titleWidget];
    }

    return Column(
      children: children,
    );
  }
}
