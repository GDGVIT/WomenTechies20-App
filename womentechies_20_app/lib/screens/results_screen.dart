import 'package:flutter/material.dart';
import 'package:womentechies_20_app/widgets/header.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top * 2),
          Header('Results'),
        ],
      ),
    );
  }
}
