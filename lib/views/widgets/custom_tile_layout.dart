import 'package:simplife/global.dart';

class CustomTileLayout extends StatelessWidget {
  final Widget? topLeft;
  final Widget? topRight;
  final Widget? bottomLeft;
  final Widget? bottomRight;
  final Widget? center;
  final custom_tile tile;
  final EdgeInsetsGeometry contentMargin;

  CustomTileLayout({
    Key? key,
    required this.tile,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.center,
    this.contentMargin = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom_tile(
      // Récupérer toutes les propriétés de votre tile ici
      backgroundColor: tile.backgroundColor,
      padding: tile.padding,
      margin: tile.margin,
      //... autres propriétés
      contentChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (topLeft != null || topRight != null)
            Row(
              children: [
                if (topLeft != null) Expanded(child: topLeft!),
                if (topRight != null) Expanded(child: topRight!),
              ],
            ),
          SizedBox(height: contentMargin.vertical), // Ajout d'une marge en haut
          if (center != null) Expanded(child: center!),
          SizedBox(height: contentMargin.vertical), // Ajout d'une marge en bas
          if (bottomLeft != null || bottomRight != null)
            Row(
              children: [
                if (bottomLeft != null) Expanded(child: bottomLeft!),
                if (bottomRight != null) Expanded(child: bottomRight!),
              ],
            ),
        ],
      ),
    );
  }
}