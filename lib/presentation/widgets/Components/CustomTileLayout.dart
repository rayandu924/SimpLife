import 'package:simplife/librairies.dart';

class CustomTileLayout extends StatelessWidget {
  final Widget? topLeft;
  final Widget? topCenter; 
  final Widget? topRight;
  final Widget? bottomLeft;
  final Widget? bottomCenter; 
  final Widget? bottomRight;
  final Widget? center;
  final CustomTile tile;
  final EdgeInsetsGeometry contentMargin;

  CustomTileLayout({
    Key? key,
    required this.tile,
    this.topLeft,
    this.topCenter, 
    this.topRight,
    this.bottomLeft,
    this.bottomCenter, 
    this.bottomRight,
    this.center,
    this.contentMargin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tile.copyWith(
      contentChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (topLeft != null || topCenter != null || topRight != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (topLeft != null) topLeft!,
                if (topCenter != null) Expanded(child: topCenter!),
                if (topRight != null) topRight!,
              ],
            ),
          SizedBox(height: contentMargin.vertical), // Ajout d'une marge en haut
          if (center != null) center!,
          SizedBox(height: contentMargin.vertical), // Ajout d'une marge en bas
          if (bottomLeft != null || bottomCenter != null || bottomRight != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (bottomLeft != null) bottomLeft!,
                if (bottomCenter != null) Expanded(child: bottomCenter!),
                if (bottomRight != null) bottomRight!,
              ],
            ),
        ],
      ),
    );
  }
}