import 'package:simplife/global.dart';

class custom_tile extends StatelessWidget {
  const custom_tile({
    Key? key,
    this.backgroundColor,
    this.contentPadding = const EdgeInsets.all(10),
    this.contentMargin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
    this.shadowColor,
    this.elevation,
  }) : super(key: key);

  final Color? backgroundColor;
  final EdgeInsets contentMargin;
  final EdgeInsets contentPadding;
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
        padding: contentPadding,
        margin: contentMargin,
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
        child: contentChild,
      ),
    );
  }
}