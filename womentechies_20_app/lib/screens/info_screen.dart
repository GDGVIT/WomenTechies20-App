import 'dart:io';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snaplist/snaplist.dart';
import 'package:snaplist/snaplist_controller.dart';
import 'package:womentechies_20_app/screens/easter.dart';
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
    _tabController = new TabController(length: 4, vsync: this);
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
                  Tab(
                    text: 'Women of DSC VIT',
                  ),
                  Tab(text: 'Men of DSC VIT')
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SpeakerTab(),
                  SponsorTab(),
                  WomenTab(),
                  MenTab(),
                ],
              ),
            )
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

class MenTab extends StatelessWidget {
  final List<String> names = [
    "ABDEALI",
    "Aditya Madan",
    'Akshat Gupta',
    'Amogh Lele',
    'Angad Sharma',
    'Anshul Bamb',
    'Arjun Bhanot',
    'Ashutosh Kaushik',
    'Aviral Chauhan',
    'Chanakya Kapoor',
    'Deepak Malpani',
    'Deepak Nahar',
    'Ekaansh Arora',
    'Fenil Jain',
    'Govind Krishnan',
    'Hardik Kataria',
    'Kush',
    'Mayank Kumar',
    'Md Hishaam Akhtar',
    'Meherdeep Thakur',
    'Neil Kavalakkat',
    'Nirmit Jatana',
    'Prakhar Soni',
    'Pranav Raaghav',
    'Prateek Mewara',
    'Purushottam Sharma',
    'Raman',
    'Rithik Jain',
    'Rohit Menon',
    'Sai Sandeep Rayanuthala.webp',
    'Shantanu Verma',
    'Shivansh Tiwari',
    'Siddhartha Verma',
    'Srinjay Saha',
    'Swayam S. Sharma',
    'Tanmay Srivastava',
    'Thanmay V',
    'Ubaid Usmani',
    'Vishaal Selvaraj',
    'Yuvraj',
  ];
  final List<String> occupation = [
    'Android Developer',
    'Senior Data Analyst',
  ];

  final List<String> imageStrings = [
    'assets/core/ABDEALI.webp',
    'assets/core/AdityaMadan.webp',
    'assets/core/AkshatGupta.webp',
    'assets/core/AmoghLele.webp',
    'assets/core/angadsharma.webp',
    'assets/core/AnshulBamb.webp',
    'assets/core/ArjunBhanot.webp',
    'assets/core/AshutoshKaushik.webp',
    'assets/core/AviralChauhan.webp',
    'assets/core/ChanakyaKapoor.webp',
    'assets/core/DeepakMalpani.webp',
    'assets/core/DeepakNahar.webp',
    'assets/core/EkaanshArora.webp',
    'assets/core/FenilJain.webp',
    'assets/core/GovindKrishnan.webp',
    'assets/core/HardikKataria.webp',
    'assets/core/Kush.webp',
    'assets/core/MayankKumar.webp',
    'assets/core/MdHishaamAkhtar.webp',
    'assets/core/meherdeepthakur.webp',
    'assets/core/NeilKavalakkat.webp',
    'assets/core/NirmitJatana.webp',
    'assets/core/prakharsoni.webp',
    'assets/core/PranavRaaghav.webp',
    'assets/core/PrateekMewara.webp',
    'assets/core/PurushottamSharma.webp',
    'assets/core/RamanStudios.webp',
    'assets/core/RithikJain.webp',
    'assets/core/RohitMenon.webp',
    'assets/core/SaiSandeepRayanuthala.webp',
    'assets/core/ShantanuVerma.webp',
    'assets/core/ShivanshTiwari.webp',
    'assets/core/SiddharthaVerma.webp',
    'assets/core/SrinjaySaha.webp',
    'assets/core/SwayamS.Sharma.webp',
    'assets/core/TanmaySrivastava.webp',
    'assets/core/ThanmayV.webp',
    'assets/core/UbaidUsmani.webp',
    'assets/core/VishaalSelvaraj.webp',
    'assets/core/Yuvraj.webp',
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
            child: GestureDetector(
              onTap: () => Fluttertoast.showToast(msg: "Nope. No secrets here"),
              onDoubleTap: () => Fluttertoast.showToast(
                  msg: "You refuse to give up, don\'t you?"),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => EasterEgg(),
                  ),
                );
              },
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
            ),
          );
        },
      ),
    );
  }
}

class WomenTab extends StatelessWidget {
  final List<String> names = [
    "Ananya G",
    "Arushi Jain",
    'Gurnehmat Dhindsa',
    'Ishi Yadav',
    'Janvi Prasad',
    'Kritika Sharma',
    'Manorama M',
    'Muskan Rastogi',
    'Pragati Bhattad',
    'Pranjal Borkar',
    'Riddhi Gupta',
    'Ruchica Sinha',
    'Sanchi',
    'Saloni Parekh',
    'Satkriti Singh',
  ];
  final List<String> occupation = [
    'Android Developer',
    'Senior Data Analyst',
  ];
  final List<String> about = [
    "Ananya is a serial sleeper",
    "Arushi is also known as \nthe silent killer",
    'Gurnehmat can talk about  ANYTHING!',
    'This is Ishi.\n She is a HUGE gaming nerd.',
    'Janvi is (not so secretly) a designer 🖊',
    'Fun Fact: \nKritika can walk faster than wind',
    'This is Manorama. She is pretty good at art',
    'Muskan loves speaking more than Modi',
    'Pragati has more GPA than 2 members combined. 🤓',
    'Fun Fact:\nPranjal is a huge anime fan',
    'Riddhi Gupta is secretly an app developer 🤫',
    'Ruchica might be moderately evil, we\'ve heard some rumours flying around 😈',
    'Fun Fact:\nSanchi loves cuddling teddy bears 🧸',
    'Saloni Parekh == silent storm',
    'Satkriti ❤ Prateek',
  ];
  final List<String> imageStrings = [
    'assets/core/AnanyaG.webp',
    'assets/core/ArushiJain.webp',
    'assets/core/GurnehmatDhindsa.webp',
    'assets/core/IshiYadav.webp',
    'assets/core/JanviPrasad.webp',
    'assets/core/kritikasharma.webp',
    'assets/core/ManoramaM.webp',
    'assets/core/MuskanRastogi.webp',
    'assets/core/PragatiBhattad.webp',
    'assets/core/ChiyaBorkar.webp',
    'assets/core/RiddhiGupta.webp',
    'assets/core/RuchicaSinha.webp',
    'assets/core/Sanchi.webp',
    'assets/core/SaloniParekh.webp',
    'assets/core/SatkritiSingh.webp',
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
          return FlipCard(
            back: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1F8A959E),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 2),
                ],
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      about[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            front: Container(
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
  ];
  final List<String> occupation = [
    'Android Developer',
    'Senior Data Analyst',
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
