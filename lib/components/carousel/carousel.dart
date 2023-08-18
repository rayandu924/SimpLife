import '../../widgets.dart';

class carousel extends StatefulWidget {
  final List<Widget> children;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;

  carousel({
    required this.children,
    this.activeIndicatorColor = Colors.black,
    this.inactiveIndicatorColor = Colors.grey,
  });

  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<carousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.children,
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.children.map((img) {
            int index = widget.children.indexOf(img);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? widget.activeIndicatorColor
                    : widget.inactiveIndicatorColor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
