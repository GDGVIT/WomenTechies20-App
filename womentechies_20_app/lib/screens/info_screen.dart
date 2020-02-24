import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';
import 'package:snaplist/snaplist_controller.dart';
import 'package:womentechies_20_app/utils/colors.dart';
import 'package:womentechies_20_app/utils/styles.dart';

class InfoScreen extends StatefulWidget {
  static const routename = "/info";

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: backgroundColor,
              pinned: true,
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelStyle: selectedLabelStyle,
                labelColor: Colors.pink,
                labelPadding: EdgeInsets.only(left: 55, right: 55),
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(color: backgroundColor),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: <Widget>[
                  Tab(
                    text: 'Speakers',
                  ),
                  Tab(
                    text: 'Sponsors',
                  ),
                  Tab(
                    text: 'The Team',
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SpeakerTab(),
                  SpeakerTab(),
                  SpeakerTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SpeakerTab extends StatelessWidget {
  final List<String> names = [
    "Aayushma Agrawal",
    "Aishwarya Ramachandran",
  ];
  final List<String> occupation = [
    'Occupation',
    'Occupation',
  ];
  final List<String> about = [
    "Aayushma Agrawal is an active public speaker and writer. She is currently working as an Android Developer at Lenskart.",
    "Aishwarya Ramachandran is an active public speaker and writer. She is currently working as Senior Data Analyst at Cerner.",
  ];
  final List<String> imageStrings = [
    'speaker1.jpeg',
    'speaker2.jfif',
  ];
  final SnaplistController snaplistController =
      new SnaplistController(initialPosition: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SnapList(
        snaplistController: snaplistController,
        axis: Axis.vertical,
        sizeProvider: (index, data) => Size(300, 390),
        separatorProvider: (index, data) => Size(0, 20),
        count: names.length,
        builder: (context, index, data) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1F8A959E),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 2),
                ]),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(imageStrings[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    names[index],
                    style: nameStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    occupation[index],
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      about[index],
                      style: subtitleStyle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
