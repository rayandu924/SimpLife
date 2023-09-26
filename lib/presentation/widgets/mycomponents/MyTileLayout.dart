import 'package:simplife/libraries.dart';

class MyTileLayout extends StatelessWidget {
  final Widget? topLeft;
  final Widget? topCenter;
  final Widget? topRight;
  final Widget? bottomLeft;
  final Widget? bottomCenter;
  final Widget? bottomRight;
  final Widget? center;
  final MyTile tile;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry rowMargin;

  MyTileLayout({
    Key? key,
    required this.tile,
    this.topLeft,
    this.topCenter,
    this.topRight,
    this.bottomLeft,
    this.bottomCenter,
    this.bottomRight,
    this.center,
    this.padding = const EdgeInsets.all(0),
    this.rowMargin = const EdgeInsets.symmetric(vertical: 8.0), // Espacement par défaut entre les lignes
  }) : super(key: key);

  Widget _buildRow(Widget? left, Widget? center, Widget? right) {
    return Container(
      margin: rowMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          left ?? Container(),
          if (center != null) Expanded(child: center),
          right ?? Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return tile.copyWith(
      contentChild: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRow(topLeft, topCenter, topRight),
            if (center != null) Padding(
              padding: rowMargin, 
              child: center!,
            ),
            _buildRow(bottomLeft, bottomCenter, bottomRight),
          ],
        ),
      ),
    );
  }
}
