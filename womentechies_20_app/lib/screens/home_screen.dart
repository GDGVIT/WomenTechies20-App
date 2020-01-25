import 'package:flutter/material.dart';
import 'package:womentechies_20_app/widgets/header.dart';

class MyHomeScreen extends StatefulWidget {
  static const routename = '/home';

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top*2),
          Header('Timeline'),
        ],
      ),
    );
  }
}
