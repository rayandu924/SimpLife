import 'package:flutter/material.dart';
import 'settings.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final Settings settings;
  final List<IconData> icons;
  final List<Widget> pages;

  MyBottomNavigationBar({
    required this.settings, 
    required this.icons, 
    required this.pages,
  });

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        widget.pages[currentIndex],
        Align(
          alignment: Alignment.bottomCenter,
          child: IntrinsicWidth(
            child: Container(
              margin: EdgeInsets.all(20),
              height: size.width * .155,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: widget.settings.backGroundSecondaryColor.withOpacity(.15),
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.icons.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(
                        () {
                          currentIndex = index;
                        },
                      );
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
                              color: widget.settings.foreGroundPrimaryColor,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10),
                              ),
                            ),
                          ),
                          Icon(
                            widget.icons[index],
                            size: size.width * .076,
                            color: index == currentIndex
                                ? widget.settings.foreGroundPrimaryColor
                                : Colors.black38,
                          ),
                          SizedBox(height: size.width * .03),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
