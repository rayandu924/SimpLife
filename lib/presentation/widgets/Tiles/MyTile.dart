// Custom Tile widget for improved and flexible design
///
/// A customizable tile that can be used to display content with various styles and actions.
/// This tile is an extension of InkWell, allowing it to respond to touch gestures with ink splash.
/// Various properties can be set to customize its appearance and behavior.

import 'package:simplife/libraries.dart';

class MyTile extends StatelessWidget {
  const MyTile ({
    Key? key,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.isEnabled = true,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onHighlightChanged,
    this.onHover,
    this.excludeFromSemantics = false,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.highlightColor,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback = true,
    this.canRequestFocus = true,
    this.focusNode,
    this.autofocus = false,
    this.contentChild,
    this.wrapChild = false,  // Nouveau paramètre
    this.shadowColor,
    this.elevation,
  }) : super(key: key);

  final Color? backgroundColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isEnabled;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;
  final bool excludeFromSemantics;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? highlightColor;
  final double? borderRadius;
  final ShapeBorder? customBorder;
  final bool enableFeedback;
  final bool canRequestFocus;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget? contentChild;
  final bool wrapChild;  // Nouveau paramètre
  final Color? shadowColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      onDoubleTap: isEnabled ? onDoubleTap : null,
      onLongPress: isEnabled ? onLongPress : null,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      excludeFromSemantics: excludeFromSemantics,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      highlightColor: highlightColor,
      radius: borderRadius,
      customBorder: customBorder,
      enableFeedback: enableFeedback,
      canRequestFocus: canRequestFocus,
      focusNode: focusNode,
      autofocus: autofocus,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          boxShadow: elevation != null && shadowColor != null
              ? [
                  BoxShadow(
                    color: shadowColor!,
                    blurRadius: elevation!,
                  ),
                ]
              : null,
        ),
        child: wrapChild ? Wrap(children: [if (contentChild != null) contentChild!]) : contentChild,
      ),
    );
  }

  MyTile copyWith({
    Color? backgroundColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool? isEnabled,
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    ValueChanged<bool>? onHighlightChanged,
    ValueChanged<bool>? onHover,
    bool? excludeFromSemantics,
    Color? focusColor,
    Color? hoverColor,
    Color? splashColor,
    Color? highlightColor,
    double? borderRadius,
    ShapeBorder? customBorder,
    bool? enableFeedback,
    bool? canRequestFocus,
    FocusNode? focusNode,
    bool? autofocus,
    Widget? contentChild,
    bool? wrapChild,  // Nouveau paramètre
    Color? shadowColor,
    double? elevation,
  }) {
    return MyTile(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      isEnabled: isEnabled ?? this.isEnabled,
      onTap: onTap ?? this.onTap,
      onDoubleTap: onDoubleTap ?? this.onDoubleTap,
      onLongPress: onLongPress ?? this.onLongPress,
      onHighlightChanged: onHighlightChanged ?? this.onHighlightChanged,
      onHover: onHover ?? this.onHover,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      borderRadius: borderRadius ?? this.borderRadius,
      customBorder: customBorder ?? this.customBorder,
      enableFeedback: enableFeedback ?? this.enableFeedback,
      canRequestFocus: canRequestFocus ?? this.canRequestFocus,
      focusNode: focusNode ?? this.focusNode,
      autofocus: autofocus ?? this.autofocus,
      contentChild: contentChild ?? this.contentChild,
      wrapChild: wrapChild ?? this.wrapChild,  // Nouveau paramètre
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
    );
  }
}