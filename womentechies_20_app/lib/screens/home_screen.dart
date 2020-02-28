import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:womentechies_20_app/utils/styles.dart';
// import 'package:womentechies_20_app/widgets/timeline_card.dart';
import '../models/event.dart';

class MyHomeScreen extends StatelessWidget {
  final List<Event> day1 = [
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
      faIcon: FaIcon(FontAwesomeIcons.solidHandPaper,
          color: Colors.white, size: 15),
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
      faIcon:
          FaIcon(FontAwesomeIcons.pizzaSlice, color: Colors.white, size: 15),
      color: Colors.orange,
    ),
    Event(
      name: 'Break',
      time: '6:00 - 10:00 AM',
      faIcon: FaIcon(FontAwesomeIcons.bed, color: Colors.white, size: 15),
      color: Colors.pink,
    ),
  ];

  final List<Event> day2 = [
    Event(
      name: 'Participants Reassemble',
      time: '10:00 - 11:00 AM',
      faIcon:
          FaIcon(FontAwesomeIcons.userFriends, color: Colors.white, size: 15),
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
      faIcon:
          FaIcon(FontAwesomeIcons.pizzaSlice, color: Colors.white, size: 15),
      color: Colors.pink,
    ),
    Event(
      name: 'Pitching Sessions',
      time: '5:00 - 7:00 PM',
      faIcon:
          FaIcon(FontAwesomeIcons.personBooth, color: Colors.white, size: 15),
      color: Colors.deepPurple[400],
    ),
    Event(
      name: 'Valedictory Ceremony',
      time: '7:00 PM',
      faIcon: FaIcon(FontAwesomeIcons.medal, color: Colors.white, size: 15),
      color: Colors.orange,
    ),
  ];

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
                    fontFamily: 'Montserrat',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Day 1',
                style: selectedLabelStyle.copyWith(
                    color: Colors.pink, fontSize: 26),
              ),
              for (int index = 0; index < day1.length; index++)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Stack(
                    children: <Widget>[
                      ListTile(
                        // onTap: () {},
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                        title: Text(day1[index].name),
                        subtitle: Text(
                          day1[index].time,
                        ),
                      ),
                      if (index - 1 >= 0)
                        Positioned(
                          left: 34,
                          child: Container(
                            height: 50,
                            width: 2,
                            color: day1[index - 1].color,
                          ),
                        ),
                      Positioned(
                        left: 15,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (day1[index].faIcon.icon ==
                                    FontAwesomeIcons.pizzaSlice) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'You sure do love pizza, don\'t you');
                                }
                                if (day1[index].faIcon.icon ==
                                    FontAwesomeIcons.bed) {
                                  Fluttertoast.showToast(
                                      msg: 'Sleep is for the weak');
                                }
                                
                              },
                              child: CircleAvatar(
                                // child: FaIcon(FontAwesomeIcons.utensils, color: Colors.white,),
                                child: day1[index].faIcon,
                                backgroundColor: day1[index].color,
                              ),
                            ),
                            if (index != day1.length - 1)
                              Container(
                                height: 50,
                                width: 2,
                                color: day1[index].color,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Text(
                'Day 2',
                style: selectedLabelStyle.copyWith(color: Colors.pink, fontSize: 26),
              ),
              for (int index = 0; index < day2.length; index++)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Stack(
                    children: <Widget>[
                      ListTile(
                        // onTap: () {},
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                        title: Text(day2[index].name),
                        subtitle: Text(
                          day2[index].time,
                        ),
                      ),
                      if (index - 1 >= 0)
                        Positioned(
                          left: 34,
                          child: Container(
                            height: 50,
                            width: 2,
                            color: day2[index - 1].color,
                          ),
                        ),
                      Positioned(
                        left: 15,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: (){
                                if(day2[index].faIcon.icon == FontAwesomeIcons.pizzaSlice){
                                  Fluttertoast.showToast(msg: 'No secrets here');
                                }
                              },
                              child: CircleAvatar(
                                // child: FaIcon(FontAwesomeIcons.utensils, color: Colors.white,),
                                child: day2[index].faIcon,
                                backgroundColor: day2[index].color,
                              ),
                            ),
                            if (index != day2.length - 1)
                              Container(
                                height: 50,
                                width: 2,
                                color: day2[index].color,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
