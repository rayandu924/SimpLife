import 'package:flutter/material.dart';

enum presentationContentType { above, below }

class presentationContent extends StatelessWidget {
  final Widget title;
  final Widget child;
  final presentationContentType titlePosition;
  final Alignment titleAlignment;

  presentationContent({
    required this.title,
    required this.child,
    this.titlePosition = presentationContentType.above,
    this.titleAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Align(
      alignment: titleAlignment,
      child: title,
    );

    List<Widget> children;

    if (titlePosition == presentationContentType.above) {
      children = [titleWidget, Expanded(child: child)];
    } else {
      children = [Expanded(child: child), titleWidget];
    }

    return Column(
      children: children,
    );
  }
}
