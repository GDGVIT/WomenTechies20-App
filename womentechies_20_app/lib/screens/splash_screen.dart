import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:womentechies_20_app/main.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
import './login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routename = '/splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();
  Future<bool> checkLoggedIn;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
    pushNextPage();
  }

  void checkLogin() {
    checkLoggedIn = sharedPrefsCutsom.getIfLoggedIn();
    checkLoggedIn.then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }

  void pushNextPage() {
    Future.delayed(Duration(seconds: 2), () {
      if (isLoggedIn == false) {
        Navigator.of(context).pushReplacement(PageTransition(
            child: LoginScreen(), type: PageTransitionType.rightToLeft));
      } else if (isLoggedIn == null) {
        Navigator.of(context).pushReplacement(PageTransition(
            child: LoginScreen(), type: PageTransitionType.rightToLeft));
        sharedPrefsCutsom.setIfLoggedIn(false);
      } else if (isLoggedIn == true) {
        Navigator.of(context).pushReplacement(PageTransition(
            child: HomeScreen(), type: PageTransitionType.rightToLeft));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 81,
              child: Image.asset(
                'logo-orange.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
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
