//if reqd, make timeline card a widget

import 'package:flutter/material.dart';

class TimelineCard extends StatelessWidget {
  final String eventName;
  final String time;
  
  TimelineCard({
    @required this.eventName,
    @required this.time
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 70,
          child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    eventName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
