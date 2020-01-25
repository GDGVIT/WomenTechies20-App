import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import './screens/home_screen.dart';
import './screens/splash_screen.dart';
import './screens/profile_screen.dart';
import './screens/info_screen.dart';
import './screens/results_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      home: SplashScreen(),
      routes: {
        HomeScreen.routename: (_) => HomeScreen(),
        SplashScreen.routename: (_) => SplashScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  static const routename = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    setState(() {
      currentPage = 0;
    });
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            MyHomeScreen(),
            InfoScreen(),
            ResultsScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentPage,
        onItemSelected: (index) {
          setState(() {
            currentPage = index;
          });
          _pageController.jumpToPage(currentPage);
        },
        items: [
          BottomNavyBarItem(
            title: Text('Timeline'),
            icon: Icon(Icons.home),
            activeColor: Colors.deepPurple,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Info'),
            icon: Icon(Icons.info),
            activeColor: Colors.deepOrange,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Results'),
            icon: Icon(Icons.flag),
            inactiveColor: Colors.grey,
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
            inactiveColor: Colors.grey,
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
