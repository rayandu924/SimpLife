import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class Settings {
  Color backGroundColor;
  Color foreGroundPrimaryColor;
  Color foreGroundSecondaryColor;
  Color bottomNavigationBarColor;

  Settings({
    this.backGroundColor = const Color.fromARGB(255, 23, 6, 150),
    this.foreGroundPrimaryColor = const Color.fromARGB(255, 170, 0, 255),
    this.foreGroundSecondaryColor = const Color.fromARGB(255, 255, 255, 255),
    this.bottomNavigationBarColor = const Color.fromARGB(255, 35, 0, 150),
  });
}

class MyApp extends StatelessWidget {
  final Settings settings = Settings();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpLife',
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
        pageBuilder: () => HomePage(settings: widget.settings),
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
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: widget.settings.backGroundColor,
        child: Center(
          child: _tabs[_selectedIndex].pageBuilder(),
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _tabs.map((tab) => tab.item).toList(),
        backgroundColor: widget.settings.bottomNavigationBarColor,
        activeColor: widget.settings.foreGroundPrimaryColor,
        inactiveColor: widget.settings.foreGroundSecondaryColor,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final Settings settings;

  HomePage({required this.settings});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // change this with the actual number of cards
      padding: EdgeInsets.all(10), // add padding around the ListView
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0), // add vertical space between cards
          child: CustomContainer(
            title: 'Al-Fatihah',
            subtitle: 'Ayat No: 1',
            gradientColors: [
              Color(0xFFDF98FA),
              Color(0xFFB070FD),
              Color(0xFF9055FF),
            ],
          ),
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Settings settings;

  ProfilePage({required this.settings});

  @override
  Widget build(BuildContext context) {
    return Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: settings.foreGroundSecondaryColor));
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Color> gradientColors;

  CustomContainer({
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
        mainAxisAlignment: MainAxisAlignment.end, // Align children at the end/bottom
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
