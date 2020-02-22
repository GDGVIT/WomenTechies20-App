import 'package:flutter/material.dart';


class TeamInfoScreen extends StatelessWidget {
  static const routename = "/team-info";
  PreferredSizeWidget myAppBar(String title, BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: AppBar(
          centerTitle: true,
          // backgroundColor: Colors.blue,
          title: Container(
            margin: EdgeInsets.only(top: 45, bottom: 20,),
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: Theme.of(context).appBarTheme.textTheme.title.copyWith(
                    color: Colors.orange,
                    fontSize: 30,
                  ),
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('The Team', context),
      body: Container(
        child: Center(child: Text('Team Info'),),
      ),
    );
  }
}
