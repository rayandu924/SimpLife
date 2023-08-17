import '../../widgets.dart';

enum presentationType { basic }

class presentationTile extends StatelessWidget {
  final presentationType type;
  final List<Widget> children;

  presentationTile({
    required this.type,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Widget tile;

    switch (type) {
      case presentationType.basic:
        tile = basicPresentationTile(children: children);
        break;
      default:
        tile = basicPresentationTile(children: children);
    }

    return tile;
  }

  Widget basicPresentationTile({required List<Widget> children}) {
    return Stack(
      children: [
        Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(left: 6, bottom: 6),
                child: children[0],
              ),
            ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.only(right: 6, top: 6),
            child: children[1],
          ),
        ),
      ],
    );
  }
}

