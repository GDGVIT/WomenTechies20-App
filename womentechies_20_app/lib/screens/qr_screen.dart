import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
import 'package:womentechies_20_app/utils/styles.dart';

import 'login_screen.dart';

class QrCodeScreen extends StatelessWidget {
  static const routename = "/QR";
  final SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();

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
                    color: Colors.pink,
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
      appBar: myAppBar('QR Code', context),
      body: FutureBuilder(
        future: sharedPrefsCutsom.getUserEmail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Email', style: boldText),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data,
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
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
              )),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
