import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class Settings {
  Color backGroundPrimaryColor;
  Color backGroundSecondaryColor;
  Color foreGroundPrimaryColor;
  Color foreGroundSecondaryColor;

  Settings({
    this.backGroundPrimaryColor = const Color.fromARGB(255, 23, 6, 150),
    this.backGroundSecondaryColor = const Color.fromARGB(255, 35, 0, 150),
    this.foreGroundPrimaryColor = const Color.fromARGB(255, 170, 0, 255),
    this.foreGroundSecondaryColor = const Color.fromARGB(255, 255, 255, 255),
  });
}

class MyApp extends StatelessWidget {
  final Settings settings = Settings();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpLife',
      theme: ThemeData(
        canvasColor: Colors.transparent, // Ajouter cette ligne
      ),
      home: MyHomePage(settings: settings),
    );
  }
}

class TabInfo {
  BottomNavigationBarItem item;
  Widget Function() pageBuilder;

  TabInfo({required this.item, required this.pageBuilder});
}

class MyHomePage extends StatefulWidget {
  final Settings settings;

  MyHomePage({required this.settings});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  List<TabInfo> _tabs = [];

  @override
  void initState() {
    super.initState();
    _tabs = [
      TabInfo(
        item: BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        pageBuilder: () => HomePage(
          settings: widget.settings,
          onSectionTap: (section) {
            _navigatorKeys[_selectedIndex].currentState!.push(
              MaterialPageRoute(
                builder: (context) => section,
              ),
            );
          },
        ),
      ),
      TabInfo(
        item: BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          label: 'Profile',
        ),
        pageBuilder: () => ProfilePage(settings: widget.settings),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex == index) {
        _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_selectedIndex != 0) {
            _onItemTapped(0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: List.generate(_tabs.length, (index) {
            return Offstage(
              offstage: _selectedIndex != index,
              child: Navigator(
                key: _navigatorKeys[index],
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => _tabs[index].pageBuilder(),
                  );
                },
              ),
            );
          }).toList(),
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: _tabs.map((tab) => tab.item).toList(),
          backgroundColor: widget.settings.backGroundSecondaryColor,
          activeColor: widget.settings.foreGroundPrimaryColor,
          inactiveColor: widget.settings.foreGroundSecondaryColor,
        ),
      ),
    );
  }
}

abstract class BaseSectionPage extends StatefulWidget {
  final Settings settings;
  final String title;

  BaseSectionPage({
    required this.settings,
    required this.title,
  });

  Widget buildPage(BuildContext context);

  @override
  _BaseSectionPageState createState() => _BaseSectionPageState();
}

class _BaseSectionPageState extends State<BaseSectionPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Page 1'),
    new Tab(text: 'Page 2'),
    new Tab(text: 'Page 3'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: widget.settings.backGroundSecondaryColor,
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
          indicatorColor: widget.settings.foreGroundPrimaryColor,
          labelColor: widget.settings.foreGroundPrimaryColor,
          unselectedLabelColor: widget.settings.foreGroundSecondaryColor,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return widget.buildPage(context);
        }).toList(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Settings settings;
  final Function(Widget) onSectionTap;

  HomePage({required this.settings, required this.onSectionTap});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [
    {
      'title': 'Sport',
      'subtitle': 'Stay active',
      'gradientColors': [Color(0xFF60BE93), Color(0xFF1B8D59), Color(0xFF00FFFF)]
    },
    {
      'title': 'Alimentation',
      'subtitle': 'Stay healthy',
      'gradientColors': [Color(0xFF60BE93), Color(0xFF1B8D59), Color(0xFF00FFFF)]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.settings.backGroundPrimaryColor,
      child: ReorderableListView.builder(
        itemCount: items.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final Map<String, dynamic> item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        itemBuilder: (context, index) {
          return ReorderableDragStartListener(
            index: index,
            key: Key('${items[index]['title']}'), // Move key here
            child: ListTile(
              title: SectionCardItem(
                title: items[index]['title'],
                subtitle: items[index]['subtitle'],
                gradientColors: items[index]['gradientColors'],
              ),
              onTap: () => widget.onSectionTap(getPage(items[index]['title'])),
            ),
          );
        },
      ),
    );
  }

  Widget getPage(String title) {
    switch (title) {
      case 'Sport':
        return SportPage(settings: widget.settings);
      case 'Alimentation':
        return AlimentationPage(settings: widget.settings);
      default:
        return Center(child: Text('Page non trouvée'));
    }
  }
}
class SectionCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Color> gradientColors;

  SectionCardItem({
    required this.title,
    required this.subtitle,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ((MediaQuery.of(context).size.height - 160) / 5),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, .6, 1],
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class SportPage extends BaseSectionPage {
  SportPage({required Settings settings})
      : super(settings: settings, title: 'Sport');

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: settings.backGroundPrimaryColor, // Changez cette ligne pour la couleur que vous voulez
      child: Center(
        child: Text('Contenu de la section Sport'),
      ),
    );
  }
}

class AlimentationPage extends BaseSectionPage {
  AlimentationPage({required Settings settings})
      : super(settings: settings, title: 'Alimentation');

  @override
  Widget buildPage(BuildContext context) {
    return Container(
      color: settings.backGroundPrimaryColor,
      child: Center(
        child: Text('Contenu de la section Alimentation'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Settings settings;

  ProfilePage({required this.settings});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profil'),
    );
  }
}