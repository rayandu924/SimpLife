import 'package:flutter/material.dart';
import 'settings.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final Settings settings;
  final List<IconData> icons;
  final Function(int) onTabTapped;
  final int currentIndex;

  MyBottomNavigationBar({
    required this.settings,
    required this.icons,
    required this.onTabTapped,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconWidth = 60.0; // Define the desired width for each icon

    if (icons.isEmpty) return SizedBox.shrink(); // Return an empty widget if no icons

    return Container(
      margin: EdgeInsets.all(20),
      height: size.width * .155,
      width: icons.length * iconWidth, // Set the width of the Container based on the number of icons
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: settings.backGroundSecondaryColor.withOpacity(.15),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Minimize the horizontal space occupied by the Row
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          icons.length,
          (index) => InkWell(
            onTap: () {
              onTabTapped(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .0422),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: settings.foreGroundPrimaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    icons[index],
                    size: size.width * .076,
                    color: index == currentIndex
                        ? settings.foreGroundPrimaryColor
                        : Colors.black38,
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
