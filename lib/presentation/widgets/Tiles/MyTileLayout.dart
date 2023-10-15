
// Custom Tile Layout for organizing widget positions inside the tile
///
/// This layout organizes the widgets inside a custom tile based on the positions provided.
/// It provides easy positioning for widgets on top, center, and bottom of the tile.
/// Each of these positions can further have left, center, and right alignments.

import 'package:simplife/libraries.dart';

class MyTileLayout extends StatelessWidget {
  final Map<String, Widget?> widgetPositions;
  final MyTile tile;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry rowMargin;

  MyTileLayout({
    Key? key,
    required this.tile,
    this.widgetPositions = const {},
    this.padding = const EdgeInsets.all(0),
    this.rowMargin = const EdgeInsets.symmetric(vertical: 8.0), // Espacement par défaut entre les lignes
  }) : super(key: key);

  Widget _buildRow({Widget? left, Widget? center, Widget? right}) {
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
            _buildRow(left: widgetPositions['topLeft'], center: widgetPositions['topCenter'], right: widgetPositions['topRight']),
            if (widgetPositions['center'] != null) Padding(
              padding: rowMargin, 
              child: widgetPositions['center']!,
            ),
            _buildRow(left: widgetPositions['bottomLeft'], center: widgetPositions['bottomCenter'], right: widgetPositions['bottomRight']),
          ],
        ),
      ),
    );
  }
}
