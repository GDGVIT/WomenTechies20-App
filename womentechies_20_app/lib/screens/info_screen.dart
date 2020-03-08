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
    _tabController = new TabController(length: 2, vsync: this);
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
        data: Theme.of(context).copyWith(accentColor: Colors.pinkAccent),
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
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SpeakerTab(),
                  SponsorTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorTab extends StatelessWidget {
  final imageStrings = [
    "assets/sponsors/jetbrains.png",
    "assets/sponsors/cloudsploit.png",
    "assets/sponsors/bugsee.png",
    "assets/sponsors/balsamiq.png",
    "assets/sponsors/sketch.png",
    "assets/sponsors/cmr.png",
    "assets/sponsors/nkcc.png",
    "assets/sponsors/goel.png",
    "assets/sponsors/MSG91.png",
  ];
  final names = [
    "Jet Brains",
    "CloudSploit",
    "Bugsee",
    "Balsamiq",
    "Sketch",
    "Century Metal Recycling Limited",
    "N K Commercial Corporation",
    "KIND Special Steels (India) Pvt Ltd",
    "MSG 91"
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
        separatorProvider: (index, data) => Size(0, 40),
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
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.pink, width: 10),
                      shape: BoxShape.rectangle,
                      // borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(imageStrings[index]),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      names[index],
                      textAlign: TextAlign.center,
                      style: nameStyle,
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

class SpeakerTab extends StatelessWidget {
  final List<String> names = [
    "Aayushma Agrawal",
    "Aishwarya Ramachandran",
    "Pooja Bhaumik",
  ];
  final List<String> occupation = [
    'Android Developer',
    'Senior Data Analyst',
    'GDE for Flutter',
  ];
  final List<String> about = [
    "Aayushma Agrawal is an active public speaker, writer and has got adventurous genes and a curious heart to explore new things. She is currently working as an Android Developer at Lenskart.",
    "Aishwarya Ramachandran is currently working as Senior Data Analyst at Cerner, with strong foundations in Machine Learning and Artifical Intelligence.",
    "Pooja Bhaumik is currently working as a Senior Engineeer at Bounce. She is a Google Developer Expert for Flutter and has a keen interest in Blogging and Public Speaking",

  ];
  final List<String> imageStrings = [
    'speaker1.jpeg',
    'speaker2.jfif',
    'speaker3.jpg',
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
        separatorProvider: (index, data) => Size(0, 40),
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
                      border: Border.all(color: Colors.pink, width: 10),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      names[index],
                      textAlign: TextAlign.center,
                      style: nameStyle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Text(
                      occupation[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
