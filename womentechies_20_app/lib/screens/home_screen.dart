import 'package:flutter/material.dart';
import 'package:womentechies_20_app/widgets/header.dart';
import 'package:womentechies_20_app/widgets/timeline_card.dart';
import '../models/event.dart';

class MyHomeScreen extends StatefulWidget {
  static const routename = '/home';

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Event> eventList;
  @override
  void initState() {
    super.initState();
    eventList = [
      Event(
          name: 'Entry to the hack begins',
          startime: TimeOfDay(hour: 18, minute: 0),
          endtime: TimeOfDay(hour: 19, minute: 0)),
      Event(
          name: 'Expert Session and DSC project Display',
          startime: TimeOfDay(hour: 19, minute: 0),
          endtime: TimeOfDay(hour: 20, minute: 0)),
      Event(
          name: 'Dinner',
          startime: TimeOfDay(hour: 21, minute: 30),
          endtime: TimeOfDay(hour: 22, minute: 30)),
      Event(
          name: 'Crazy Coding 1.0',
          startime: TimeOfDay(hour: 22, minute: 30),
          endtime: TimeOfDay(hour: 0, minute: 30)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top * 2),
          Header('Timeline'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: ListView.builder(
                itemCount: eventList.length,
                itemBuilder: (ctx, index) {
                  return Stack(
                    children: <Widget>[
                      TimelineCard(
                        eventName: eventList[index].name,
                        startime: eventList[index].startime,
                        endtime: eventList[index].endtime,
                      ),
                      Positioned(
                        top: 0,
                        //top: MediaQuery.of(ctx).size.height * 0.025,
                        left: 0,
                        bottom: 1,
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          height: 80,
                          width: 5,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Theme.of(ctx).accentColor),
                        ),
                      ),
                    ],
                  );
                  // return ListTile(
                  //   title: Text(eventList[index].name),
                  //   subtitle: Text(
                  //     '${eventList[index].startime.hour} : ${eventList[index].startime.minute} - ${eventList[index].endtime.hour} : ${eventList[index].endtime.minute}',
                  //   ),
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
