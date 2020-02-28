import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './screens/github_screen.dart';
import './screens/qr_screen.dart';

import './screens/home_screen.dart';
import './screens/splash_screen.dart';
import './screens/info_screen.dart';
import './screens/social_screen.dart';


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
      // darkTheme: ThemeData(
      //   primarySwatch: Colors.lightBlue,
      //   canvasColor: Colors.black45,
      //   textTheme: TextTheme(
      //     body1: TextStyle(color: Colors.white),

      //   ),
      // )
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.orange,
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
  static const routename = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  List<Widget> _pageList = [
    MyHomeScreen(),
    InfoScreen(),
    GithubScreen(),
    // TeamInfoScreen(),
    QrCodeScreen(),
    SocialScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: _pageIndex,
        onTap: _selectPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Padding(
                padding: EdgeInsets.only(top: 2),
                child: Text('Home'),
              ),
              icon: Icon(
                Icons.home,
                size: 28,
              )),
          BottomNavigationBarItem(
            title: (_pageIndex == 1)
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Speakers',
                      style: TextStyle(color: Colors.pink),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Speakers',
                    ),
                  ),
            activeIcon: FaIcon(
              FontAwesomeIcons.microphone,
              color: Colors.pink,
              size: 21,
            ),
            icon: FaIcon(
              FontAwesomeIcons.microphone,
              size: 21,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: FaIcon(
              FontAwesomeIcons.github,
              color: Colors.deepPurple[400],
              size: 21,
            ),
            title: (_pageIndex == 2)
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'GitHub',
                      style: TextStyle(color: Colors.deepPurple[400]),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text('GitHub'),
                  ),
            icon: FaIcon(
              FontAwesomeIcons.github,
              size: 21,
            ),
          ),
          // BottomNavigationBarItem(
          //     title: Padding(
          //       padding: const EdgeInsets.only(top: 1),
          //       child: Text('The Team'),
          //     ),
          //     icon: Padding(
          //       padding: const EdgeInsets.only(bottom: 2),
          //       child: Icon(
          //         Icons.person,
          //         size: 27,
          //       ),
          //     )),
          BottomNavigationBarItem(
            activeIcon: FaIcon(
              FontAwesomeIcons.qrcode,
              color: Colors.pink,
              size: 21,
            ),
            title: (_pageIndex == 3)
                ? Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'QR Code',
                      style: TextStyle(color: Colors.pink),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'QR Code',
                    ),
                  ),
            icon: FaIcon(
              FontAwesomeIcons.qrcode,
              size: 21,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: FaIcon(
              FontAwesomeIcons.hashtag,
              color: Colors.deepPurple[400],
              size: 21,
            ),
            title: (_pageIndex == 4)
                ? Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'Highlights',
                      style: TextStyle(color: Colors.deepPurple[400]),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('Highlights'),
                  ),
            icon: FaIcon(
              FontAwesomeIcons.hashtag,
              size: 21,
            ),
          ),
        ],
      ),
    );
  }
}
