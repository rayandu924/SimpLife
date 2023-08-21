import 'widgets.dart';

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
    Container(
      child: Text('Home'),
    ),
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
    final tabBar tabBarr = tabBar(
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
      body: TabBarView(
        controller: _tabController,
        children: [
          buildGridView(), // Contenu de la première tab
          buildProgressBarColumn(), // Contenu de la deuxième tab
          buildMoreWidgets(), // Contenu de la troisième tab
        ],
      ),
      bottomNavigationBar: tabBarr,
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.88,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      padding: EdgeInsets.zero,
      children: [
        presentationContent(
          title: Text('Title', style: Title1.copyWith(color: Colors.black)),
          titlePosition: presentationContentType.below,
          titleAlignment: Alignment.center,
          child: tile(
            backgroundColor: Colors.red,
          ),
        ),
        tile(
          backgroundColor: Colors.red,
        ),
        tile(
          backgroundColor: Colors.red,
        ),
        tile(
          backgroundColor: Colors.orange,
          borderRadius: 30,
          shadowColor: Colors.blue,
          elevation: 8,
        ),
        tile(
          backgroundColor: Colors.orange,
          contentChild: presentationTile(
            content: 
              progressBar(
                percentage: 0.5,
                width: 100,
                type: progressBarType.circular,
                progressBarColor: const Color.fromARGB(255, 54, 244, 101),
                backgroundColor: Colors.grey,
                lineHeight: 10.0,
              ),
            button: Icon(Icons.add),
        ),
        ),
      ],
    );
  }

  Widget buildProgressBarColumn() {
    return Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
            flex:
                1, // This ensures that the content will take up 50% of its parent's height
            child: presentationContent(
              title: Text('Title', style: Title1.copyWith(color: Colors.black)),
              titlePosition: presentationContentType.below,
              titleAlignment: Alignment.center,
              child: progressBar(
                percentage: 0.5,
                width: 120,
                type: progressBarType.circular,
                progressBarColor: Colors.red,
                backgroundColor: Colors.grey,
                lineHeight: 15.0,
                child: ListView(
                  children: [
                    Text("90%",
                        style: Title1.copyWith(
                            color: const Color.fromARGB(255, 0, 0, 0))),
                    Text("80%", style: Title1.copyWith(color: Colors.red)),
                    Text("70%", style: Title1.copyWith(color: Colors.red)),
                  ],
                ),
              ),
            )),
        Flexible(
          flex: 1, // The other 50% will be empty in this case
          child: tile(
            contentPadding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
            backgroundColor: Colors.blueAccent,
            contentChild: presentationTile(
            content: presentationLineChart(
              spots: [FlSpot(0, 10), FlSpot(3, 60),FlSpot(5, 30)],
              numberOfYIndicators: 4,
            ),
            button: Icon(Icons.add),
        ),
          ),
        ),
      ],
    );
  }

  Widget buildMoreWidgets() {
    return Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
            flex:
                1, // This ensures that the content will take up 50% of its parent's height
            child: carousel(
              children: [
                tile(
                  backgroundColor: Colors.red,
                ),
                tile(
                  backgroundColor: Colors.blue,
                ),
                tile(
                  backgroundColor: Colors.green,
                ),
              ],
              activeIndicatorColor: Colors.red,
              inactiveIndicatorColor: Colors.blue,
            )),
        Flexible(
          flex: 1, // The other 50% will be empty in this case
          child: tile(
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}