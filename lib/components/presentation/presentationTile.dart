import '../../widgets.dart';

class presentationTile extends StatelessWidget {
  final Widget content;
  final Widget button;

  presentationTile({
    required this.button,
    required this.content,
  });

@override
Widget build(BuildContext context) {
  return Stack(
    children: [
      // Centrer le contenu
      Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(0),
          child: content,
        ),
      ),
      // Positionner le bouton en haut à gauche
      Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.only(right: 6, top: 6),
          child: button,
        ),
      ),
    ],
  );
}

}
