import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final Key tabBarKey = UniqueKey();
  late TabController _tabController;
  final List<Widget> tabList = [
    const Text('Tab1'),
    const Tab(icon: Icon(Icons.favorite)),
    Tab(
      icon: Icon(Icons.directions_railway),
    ),
  ];
  final tabBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24), topRight: Radius.circular(24)),
  );

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: tabList.length, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GFTabBar tabBar = GFTabBar(
      key: tabBarKey,
      controller: _tabController,
      length: tabList.length,
      tabs: tabList,
      tabBarColor: Color.fromARGB(255, 9, 5, 122),
      tabBarHeight: 66,
      isScrollable: false,
      shape: tabBarShape,
      indicatorWeight: 2,
      indicatorPadding: const EdgeInsets.all(4),
      indicatorColor: Color.fromARGB(255, 247, 0, 255),
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.all(8),
      labelColor: Color.fromARGB(255, 208, 0, 255),
      unselectedLabelColor: Color.fromARGB(231, 242, 0, 255),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar'),
      ),
      body: GFTabBarView(
        controller: _tabController,
        children: [
          buildGridView(), // Contenu de la première tab
          buildProgressBarColumn(), // Contenu de la deuxième tab
          Center(
            child: Text('Tab 3 Content'),
          ),
        ],
      ),
      bottomNavigationBar: tabBar,
    );
  }

  Widget buildGridView() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double gridHeight = constraints.maxHeight;
        double tileWidth = gridHeight * 1; // Aspect ratio: 2:3

        return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          padding: EdgeInsets.zero,
          childAspectRatio: tileWidth / gridHeight,
          children: [
            GFListTile(
              color: Colors.green,
            ),
            GFListTile(
              color: Colors.red,
            ),
            GFListTile(
              color: Colors.blue,
            ),
            GFListTile(
              color: Colors.yellow,
            ),
            GFListTile(
              color: Colors.purple,
            ),
            GFListTile(
              color: Colors.orange,
            ),
            GFListTile(
              color: Colors.pink,
            ),
            GFListTile(
              color: Colors.teal,
            ),
            GFListTile(
              color: Colors.yellow, // Background color of the tile
              margin: EdgeInsets.all(16), // Margin around the tile
              padding: EdgeInsets.all(12), // Padding inside the tile
              onTap: () {
                print('Tile tapped!');
              }, // Callback function for tap event
              onLongPress: () {
                print('Tile long-pressed!');
              }, // Callback function for long press event
              focusColor: Colors.red, // Color when the tile has input focus
              hoverColor: Colors
                  .green, // Color when a pointer is hovering over the tile
              focusNode: FocusNode(), // Define a focus node for the tile
              autofocus:
                  true, // Set to true if the tile should automatically focus itself
              radius: 20.0, // Circular radius of the tile
              actionButton: Positioned(
                top: 8, // Adjust the position as needed
                right: 8, // Adjust the position as needed
                child: Opacity(
                  opacity: 0.2,
                  child: SizedBox(
                    width: 32, // Custom size of the action button
                    height: 32, // Custom size of the action button
                    child: FloatingActionButton(
                      onPressed: () {
                        print('Action button tapped!');
                      }, // Callback function for action button tap event
                      backgroundColor: Colors.red, // Color of the action button
                      child: Icon(Icons.edit), // Icon for the action button
                    ),
                  ),
                ),
              ),
              presentation: Text('Presentation'), // Presentation widget
            ),
          ],
        );
      },
    );
  }
  Widget buildProgressBarColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GFProgressBar(
          percentage: 0.5,
          type: CustomProgressType.linear,
          progressBarColor: Colors.red,
          backgroundColor: Colors.grey,
          lineHeight: 15.0,
          margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          leading: const Text('0%'),
          alignment: MainAxisAlignment.center,
        ),
      ],
    );
  }

}
