import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:womentechies_20_app/widgets/header.dart';
// import 'package:womentechies_20_app/widgets/timeline_card.dart';
import '../models/event.dart';

List<Event> eventList = [
  Event(
    name: 'Registrations Begin',
    time: '5:30 - 6:00 PM',
    faIcon: FaIcon(FontAwesomeIcons.pencilAlt, color: Colors.white, size: 15),
    color: Colors.orange,
  ),
  Event(
    name: 'Inauguration',
    time: '6:00 - 7:00 PM',
    faIcon: FaIcon(FontAwesomeIcons.ribbon, color: Colors.white, size: 15),
    color: Colors.pink,
  ),
  Event(
    name: 'Hackathon Begins',
    time: '7:00 - 9:00 PM',
    faIcon: FaIcon(FontAwesomeIcons.laptop, color: Colors.white, size: 15),
    color: Colors.deepPurple[400],
  ),
  Event(
    name: 'Attendance',
    time: '9:00 - 9:30 PM',
    faIcon: FaIcon(FontAwesomeIcons.solidHandPaper, color: Colors.white, size: 15),
    color: Colors.orange,
  ),
  Event(
    name: 'Dinner',
    time: '9:30 - 10:30 PM',
    faIcon: FaIcon(FontAwesomeIcons.utensils, color: Colors.white, size: 15),
    color: Colors.pink,
  ),
  Event(
    name: 'Hack Like A Girl',
    time: '10:30 PM',
    faIcon: FaIcon(FontAwesomeIcons.laptop, color: Colors.white, size: 15),
    color: Colors.deepPurple[400],
  ),
  Event(
    name: 'Midnight Snacks and Review 1',
    time: '1:00 AM',
    faIcon: FaIcon(FontAwesomeIcons.pizzaSlice, color: Colors.white, size: 15),
    color: Colors.orange,
  ),
  Event(
    name: 'Break',
    time: '6:00 - 10:00 AM',
    faIcon: FaIcon(FontAwesomeIcons.bed, color: Colors.white, size: 15),
    color: Colors.pink,
  ),
  Event(
    name: 'Participants Reassemble',
    time: '10:00 - 11:00 AM',
    faIcon: FaIcon(FontAwesomeIcons.userFriends, color: Colors.white, size: 15),
    color: Colors.deepPurple[400],
  ),
  Event(
    name: 'Hack Like A Girl',
    time: '11:00 AM',
    faIcon: FaIcon(FontAwesomeIcons.laptop, color: Colors.white, size: 15),
    color: Colors.orange,
  ),
  Event(
    name: 'Review 2',
    time: '12:00 - 2:00 PM',
    faIcon: FaIcon(FontAwesomeIcons.userCheck, color: Colors.white, size: 15),
    color: Colors.pink,
  ),
  Event(
    name: 'Lunch',
    time: '2:00 - 3:00 PM',
    faIcon: FaIcon(FontAwesomeIcons.utensils, color: Colors.white, size: 15),
    color: Colors.deepPurple[400],
  ),
  Event(
    name: 'Hack Like A Girl',
    time: '3:00 - 4:30 PM',
    faIcon: FaIcon(FontAwesomeIcons.laptop, color: Colors.white, size: 15),
    color: Colors.orange,
  ),
  Event(
    name: 'Snacks',
    time: '4:30 - 5:00PM',
    faIcon: FaIcon(FontAwesomeIcons.pizzaSlice, color: Colors.white, size: 15),
    color: Colors.pink,
  ),
  Event(
    name: 'Pitching Sessions',
    time: '5:00 - 7:00 PM',
    faIcon: FaIcon(FontAwesomeIcons.personBooth, color: Colors.white, size: 15),
    color: Colors.deepPurple[400],
  ),
  Event(
    name: 'Valedictory Ceremony',
    time: '7:00 PM',
    faIcon: FaIcon(FontAwesomeIcons.medal, color: Colors.white, size: 15),
    color: Colors.orange,
  ),
];

class MyHomeScreen extends StatelessWidget {
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
            margin: EdgeInsets.only(
              top: 40,
              bottom: 20,
            ),
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

  static const routename = '/timeline';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Timeline', context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: eventList.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    // child: FaIcon(FontAwesomeIcons.utensils, color: Colors.white,),
                    child: eventList[index].faIcon,
                    backgroundColor: eventList[index].color,
                  ),
                  title: Text(eventList[index].name),
                  subtitle: Text(
                    eventList[index].time,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
