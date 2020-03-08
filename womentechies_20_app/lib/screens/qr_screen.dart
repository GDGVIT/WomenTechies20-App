import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:snaplist/snaplist.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
import 'package:womentechies_20_app/screens/easter.dart';
import 'package:womentechies_20_app/utils/colors.dart';
import 'package:womentechies_20_app/utils/styles.dart';
import 'package:flip_card/flip_card.dart';

import 'login_screen.dart';

class QrCodeScreen extends StatefulWidget {
  static const routename = "/QR";

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen>
    with TickerProviderStateMixin {
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
                labelPadding: EdgeInsets.only(left: 24, right: 24),
                unselectedLabelColor: Colors.grey,
                indicator: BoxDecoration(color: backgroundColor),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: <Widget>[
                  Tab(
                    text: 'QR Code',
                  ),
                  Tab(
                    text: 'DSC VIT',
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  QRTab(),
                  TeamTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamTab extends StatelessWidget {
  final List<String> names = [
    'Angad Sharma',
    'Meherdeep Thakur',
    'Ubaid Usmani',
    'Ekaansh Arora',
    'Prateek Mewara',
    'Satkriti Singh',
    'Deepak Nahar',
    'Sanchi Chopra',
    'Amogh Lele',
    'Deepak Malpani',
    'Ananya G',
    'Ashutosh Kaushik',
    'Fenil Jain',
    'Kush',
    'Purushottam Sharma',
    'Riddhi Gupta',
    'Shantanu Sharma',
    'Siddhartha Varma',
    'Vishal Selvaraaj',
    'Aviral Chauhan',
    'Chanakya Vivek Kapoor',
    'Govind Krishnan',
    'Nirmit Jatana',
    'Prakhar Soni',
    'Mayank Kumar',
    'Md Hishaam Akhtar',
    'Pragati Bhattad',
    'Rithik Jain',
    'S Ramaneswaran',
    'Riya Kanabar',
    'Aditya Rathore',
    'Ruchica Sinha',
    'Shravani Shete',
    'Ishi Yadav',
    'Pranjal Borkar',
    'Thanmay V',
    'Swayam S. Sharma',
    'Hardik Kataria',
    'Akshat Gupta',
    'Arjun Bhanot',
    'Kritika Sharma',
    'Manorama M',
    'Muskan Rastogi',
    'Naynika Wason',
    'Saloni Parekh',
    'Anshul Bamb',
    'Abdeali',
    'Aditya Madan',
    'Arushi Jain',
    'Gurnehmat Dhindsa',
    'Tanmay Srivastava',
    'Janvi Prasad',
    'Neil Kavalakkat',
    'Pranav Raaghav',
    'Rohit Menon',
    'Shivansh Tiwari',
    'Srinjay Saha',
    'Yuvraj'
  ];
  final List<String> imageStrings = [
    'assets/core/angadsharma.webp',
    'assets/core/meherdeepthakur.webp',
    'assets/core/UbaidUsmani.webp',
    'assets/core/EkaanshArora.webp',
    'assets/core/PrateekMewara.webp',
    'assets/core/SatkritiSingh.webp',
    'assets/core/DeepakNahar.webp',
    'assets/core/Sanchi.webp',

    'assets/core/AmoghLele.webp',
    'assets/core/DeepakMalpani.webp',

    'assets/core/AnanyaG.webp',

    'assets/core/AshutoshKaushik.webp',
    'assets/core/FenilJain.webp',
    'assets/core/Kush.webp',
    'assets/core/PurushottamSharma.webp',

    'assets/core/RiddhiGupta.webp',

    'assets/core/ShantanuVerma.webp',
    'assets/core/SiddharthaVerma.webp',
    'assets/core/VishaalSelvaraj.webp',
    'assets/core/AviralChauhan.webp',
    'assets/core/ChanakyaKapoor.webp',
    'assets/core/GovindKrishnan.webp',
    'assets/core/NirmitJatana.webp',
    'assets/core/prakharsoni.webp',
    'assets/core/MayankKumar.webp',
    'assets/core/MdHishaamAkhtar.webp',

    'assets/core/PragatiBhattad.webp',

    'assets/core/RithikJain.webp',
    'assets/core/RamanStudios.webp', //s raman

    'assets/core/RiyaKanabar.webp',

    'assets/core/AdityaRathore.webp',

    'assets/core/RuchicaSinha.webp',
    'assets/core/ShravaniShete.webp',
    'assets/core/IshiYadav.webp',
    'assets/core/ChiyaBorkar.webp',

    'assets/core/ThanmayV.webp',
    'assets/core/SwayamS.Sharma.webp',

    'assets/core/HardikKataria.webp',
    'assets/core/AkshatGupta.webp',
    'assets/core/ArjunBhanot.webp',

    'assets/core/kritikasharma.webp',
    'assets/core/ManoramaM.webp',
    'assets/core/MuskanRastogi.webp',
    'assets/core/NaynikaWason.webp',
    'assets/core/SaloniParekh.webp',

    'assets/core/AnshulBamb.webp',
    'assets/core/ABDEALI.webp',
    'assets/core/AdityaMadan.webp',

    'assets/core/ArushiJain.webp',
    'assets/core/GurnehmatDhindsa.webp',

    'assets/core/TanmaySrivastava.webp',

    'assets/core/JanviPrasad.webp',

    'assets/core/NeilKavalakkat.webp',
    'assets/core/PranavRaaghav.webp',
    'assets/core/RohitMenon.webp',
    'assets/core/ShivanshTiwari.webp',
    'assets/core/SrinjaySaha.webp',
    'assets/core/Yuvraj.webp',
  ];
  final List<String> about = [
    'No Secrets here',
    'Nope, try again',
    'Nope. Wrong again',
    'Uhm you\'re close',
    'Ha! Gotcha!',
    'Satkriti ❤ Prateek',
    'Try again',
    'Fun Fact:\nSanchi loves cuddling teddy bears 🧸',
    'Nope',
    'Come on, it\'s not that difficult to find easter eggs',
    "Ananya is a serial sleeper",
    'Let it be',
    'Not your day today',
    'Do you like pizza?',
    'Do you love sleep?',
    'Riddhi Gupta is secretly an app developer 🤫',
    '01100100 01101111 01110101 01100010 01101100 01100101 00100000 01110100 01100001 01110000',
    'You\'re losing out on life if you skipped the last one',
    'Keep going',
    'Maybe you will find an easter egg some day',
    'This is not an easter egg',
    'Yell - I am so done with life',
    'Double-tapping is the key to success',
    'Sometimes the bug is a feature',
    '01100010 01101001 01101110 01100001 01110010 01111001',
    'You\'ve made it this far, you deserve an easter egg',
    'Pragati has more GPA than 2 members combined. 🤓',
    'Have you watched The Office?',
    '“No, I disagree. “R” is one of the most menacing of sounds. That’s why they call it murder not ‘muckduck’.” - Dwight Schrute',
    'Riya loves Debfesht',
    'This is an easter egg.',
    'Ruchica might be moderately evil, we\'ve heard some rumours flying around 😈',
    '𝘭𝘰𝘶𝘥 𝘴𝘤𝘳𝘦𝘦𝘤𝘩𝘪𝘯𝘨 𝘯𝘰𝘪𝘴𝘦𝘴',
    'This is Ishi.\n She is a HUGE gaming nerd.',
    'Fun Fact:\nPranjal is a huge anime fan',
    '5',
    '4',
    '3',
    '2',
    '1',
    'Fun Fact: \nKritika can walk faster than wind',
    'This is Manorama. She is pretty good at art',
    'Muskan loves speaking more than Modi',
    'Naynika plays good ukelele',
    'Saloni Parekh == silent storm',
    'Too many easter eggs together 😨',
    'When Michael Scott said, "I am running away from my responsibilities and it feels good", I felt that',
    'There are more ;)',
    "Arushi is also known as \nthe silent killer",
    'Gurnehmat can talk about  ANYTHING!',
    'Today might be your lucky day',
    'Janvi is (not so secretly) a designer 🖊',
    'Go back',
    'All done',
    'Maybe Not ;)',
    'By the way, did you double tap?',
    'Long pressing is also a thing',
    'Congratulations to have made it to the end, now get back to coding, you have efficiently wasted your time.',
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
            flipOnTouch: true,
            // back: Container(
            //   child: Center(
            //     child: Text(about[index]),
            //   ),
            // ),
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
                child: GestureDetector(
                  onDoubleTap: (){
                    Fluttertoast.showToast(msg: 'Someone somewhere hardcoded all of this');
                  },
                  onTap: (){
                    Fluttertoast.showToast(msg: 'Made with 💝 by DSC VIT');
                  },
                  onLongPress: (){
                    Fluttertoast.showToast(msg: 'Smart! Here is a duck to bless your day');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EasterEgg()));
                    
                  },
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
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Text(
                    //     occupation[index],
                    //     style: subtitleStyle,
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
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

class QRTab extends StatelessWidget {
  final SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sharedPrefsCutsom.getUserEmail(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: SingleChildScrollView(
                child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Email', style: boldText),
                  SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    child: Text(
                      snapshot.data,
                      style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text('Scan this QR Code', style: boldText),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: QrImage(
                        data: snapshot.data,
                        version: QrVersions.auto,
                        size: MediaQuery.of(context).size.height * 0.32,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      height: 90,
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        color: Colors.pink,
                        child: Text(
                          'Logout',
                          style: btnText,
                        ),
                        onPressed: () {
                          sharedPrefsCutsom.setIfLoggedIn(false);
                          Navigator.of(context).pushReplacement(PageTransition(
                              child: LoginScreen(),
                              type: PageTransitionType.leftToRight));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
