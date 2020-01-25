import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  static const routename = '/splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    pushNextPage();
  }

  void pushNextPage() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
          PageTransition(child: HomeScreen(), type: PageTransitionType.rightToLeftWithFade)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 81,
              child: Image.asset(
                'logo-orange.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'dsc-logo.png',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'DSC ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'VIT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
