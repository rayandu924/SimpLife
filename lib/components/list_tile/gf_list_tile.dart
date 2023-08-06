import 'package:flutter/material.dart';

class GFListTile extends StatelessWidget {
  const GFListTile({
    Key? key,
    this.color,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus = false,
    this.radius,
    this.shadow,
    this.actionButton,
    this.presentation, // New property for the presentation widget
  }) : super(key: key);

  final Color? color;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool enabled;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final bool selected;
  final Color? focusColor;
  final Color? hoverColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final double? radius;
  final BoxShadow? shadow;
  final Widget? actionButton;
  final Widget? presentation; // New property for the presentation widget

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
        canRequestFocus: enabled,
        focusNode: focusNode,
        focusColor: focusColor,
        hoverColor: hoverColor,
        autofocus: autofocus,
        child: Container(
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
            boxShadow: color != null
                ? [
                    shadow ??
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 7,
                          offset: const Offset(2, 4),
                        ),
                  ]
                : [],
          ),
          child: Stack(
            children: [
              actionButton ?? Container(),
              Center(
                child: presentation ?? Container(),
              ),
            ],
          ),
        ),
      );
}
