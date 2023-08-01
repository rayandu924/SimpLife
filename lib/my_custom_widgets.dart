import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'settings.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyCustomWidgets {

  static Widget mainPage(BuildContext context, TabController _tabController) {
    return SafeArea(
      child: Column(
        children: [
          myTabBar(context, _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                homePage(context, _tabController),
                exemplePage(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget homePage(BuildContext context, TabController _tabController) {
    return Column(
      children: [
        myGridList(context),
      ]);
  }

  static Widget exemplePage(BuildContext context) {
    return Column(
      children: [
      ]);
  }

  static Widget sectionPage(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: recursiveCircularIndicator(
            context,
            [
              {"percent": 0.9, "color": Colors.red},
              {"percent": 0.7, "color": Colors.green},
              {"percent": 0.4, "color": Colors.blue},
            ],
            initialRadius: 250.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: linearPercentIndicator(
            context,
            [
              {"percent": 0.9, "color": Colors.red, "title": "Red: "},
              {"percent": 0.7, "color": Colors.green, "title": "Green: "},
              {"percent": 0.4, "color": Colors.blue, "title": "Blue: "},
            ],
          ),
        ),
      ],
    );
  }


static Widget myAppBar(BuildContext context) {
  return Material(  // Add Material widget here.
    type: MaterialType.transparency,  // Make it transparent if you don't want the look of Material.
    child: Container(
      alignment: Alignment.centerLeft,  // Align the child to the left.
      padding: const EdgeInsets.all(8.0),
      child: Navigator.canPop(context)
        ? IconButton(
            icon: Icon(Icons.arrow_back, color: foregroundPrimaryColor),
            onPressed: () => Navigator.pop(context),
          )
        : Container(),  // Empty container if there's no previous page.
    ),
  );
}

static Widget myTabBar(BuildContext context, TabController _tabController) {
  double _w = MediaQuery.of(context).size.width;
  return TabBar(
    controller: _tabController,
    indicatorColor: foregroundSecondaryColor,
    unselectedLabelColor: foregroundPrimaryColor.withOpacity(0.65),
    tabs: [
      Tab(
        child: Text("Tab 1", style: TextStyle(fontWeight: FontWeight.w600, fontSize: _w / 20)),
      ),
      Tab(
        child: Text("Tab 2", style: TextStyle(fontWeight: FontWeight.w600, fontSize: _w / 20)),
      ),
    ],
  );
}
static Widget myGridItem(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => sectionPage(context)));
    },
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.red],  // Use the colors you want
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: ListTile(
            contentPadding: EdgeInsets.only(left: 10.0, bottom: 10.0),  // To add some space on the left and bottom
            title: Text('Item $index', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            subtitle: Text('Subtitle of Item $index', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    ),
  );
}

static Widget myGridList(BuildContext context) {
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10, // This defines the horizontal space between grid items
          mainAxisSpacing: 10, // This defines the vertical space between grid items
          childAspectRatio: 0.95,
        ),
        itemBuilder: (context, index) {
          return myGridItem(context, index);  // pass the context here
        },
      ),
    ),
  );
}


static Widget circularPercentIndicator(BuildContext context, Map<String, dynamic> percentColor, {double radius = 100.0, Widget childBody = const SizedBox()}) {
  double _w = MediaQuery.of(context).size.width;
  return Container(
    width: _w / 2.5,
    child: CircularPercentIndicator(
      radius: radius,
      lineWidth: 10.0,
      animation: true,
      percent: percentColor["percent"], // Indicate the progress here
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: percentColor["color"],
      backgroundColor: percentColor["color"].withOpacity(0.49),
      center: childBody,
    )
  );
}

static Widget recursiveCircularIndicator(BuildContext context, List<Map<String, dynamic>> percentColors, {double initialRadius = 100.0, List<Widget> texts = const <Widget>[]}) {
  // Condition d'arrêt de la récursion.
  if (percentColors.isEmpty) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0), // Adjust the padding here.
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: texts,
          ),
        ),
      ),
    );
  }

  // Extract the first percentage and create a copy of the list without it.
  Map<String, dynamic> percentColor = percentColors.first;
  List<Map<String, dynamic>> remainingPercentColors = percentColors.sublist(1);

  // Calculate font size based on the initial radius
  double fontSize = initialRadius / 4.5;  // Change this divisor to adjust font size

  // Add a new text widget for the current circle
  texts = [
    ...texts,
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Text(
        (percentColor["percent"] * 100).toInt().toString(),
        style: TextStyle(color: percentColor["color"], fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    )
  ];

  // Create the child widget for the next recursive call
  Widget child = recursiveCircularIndicator(context, remainingPercentColors, initialRadius: initialRadius - 30.0, texts: texts);

  return circularPercentIndicator(context, percentColor, radius: initialRadius, childBody: child);
}


static Widget linearPercentIndicator(BuildContext context, List<Map<String, dynamic>> data) {
  return Column(
    children: data.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,  // Centre le contenu
          children: [
            Center(  // Centre le Text widget
              child: Text(
                item["title"] + (item["percent"] * 100).toInt().toString() + "%",
                style: TextStyle(color: item["color"], fontSize: 24.0),
              ),
            ),
            Padding(  // Ajoute un espacement entre le texte et la barre
              padding: const EdgeInsets.only(top: 8.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                lineHeight: 20.0,
                percent: item["percent"],
                backgroundColor: item["color"].withOpacity(0.49),
                progressColor: item["color"],
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

}
