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
  return SafeArea(
    child: Column(
      children: [
        myAppBar(context),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: recursiveCircularIndicator(
            context,
            [0.9, 0.7, 0.4],
            initialRadius: 200.0,
            finalChild: Text('0\n0\n0', style: TextStyle(color: foregroundSecondaryColor, fontWeight: FontWeight.bold),),
          ),
        )
      ],
    ),
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
            icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 255, 255, 255)),
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


static Widget circularPercentIndicator(BuildContext context, double percent, {double radius = 100.0, Widget childBody = const SizedBox()}) {
  double _w = MediaQuery.of(context).size.width;
  return Container(
    width: _w / 2.5,
    child: CircularPercentIndicator(
      radius: radius,
      lineWidth: 10.0,
      animation: true,
      percent: percent, // Indicate the progress here
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: foregroundSecondaryColor,
      backgroundColor: foregroundSecondaryColor.withOpacity(0.4),
      center: childBody,
    )
  );
}
static Widget recursiveCircularIndicator(BuildContext context, List<double> percents, {double initialRadius = 100.0, Widget finalChild = const SizedBox()}) {
  // Condition d'arrêt de la récursion.
  if (percents.isEmpty) {
    return finalChild;
  }

  // Extract the first percentage and create a copy of the list without it.
  double percent = percents.first;
  List<double> remainingPercents = percents.sublist(1);

  return Stack(
    alignment: Alignment.center,
    children: [
      circularPercentIndicator(context, percent, radius: initialRadius),
      recursiveCircularIndicator(context, remainingPercents, initialRadius: initialRadius - 30.0, finalChild: finalChild)
    ],
  );
}


}
