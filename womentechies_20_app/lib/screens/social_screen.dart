import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
import '../models/instagram.dart';

class SocialScreen extends StatefulWidget {
  static const routename = "/social";

  @override
  _SocialScreenState createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  bool refresh = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();
  Future<List<Datum>> getInstaData() async {
    try {
      Instagram instagram;
      List<Datum> data;
      final url = 'https://womentechies.herokuapp.com/api/hashtaginsta';
      final authToken = await sharedPrefsCutsom.getToken();
      final response = await http.post(
        url,
        headers: {"Auth-Token": authToken},
        body: {"hashtag": "tree"},
      );
      print("got");
      if (response.statusCode == 200) {
        print("loaded");
        // print(response.body);
        if(this.mounted){
          // setState(() {
          instagram = instagramFromJson(response.body);
          data = List.from(instagram.data);
          data.retainWhere((datum) => datum.mediaType.toUpperCase() == 'IMAGE');
        // });
        }
        return data;
      }else{
        print("err");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<void> refreshOnPull(){
  //   setState(() {
  //     refresh = true;
  //   });
  // }

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
                    color: Colors.deepPurple[400],
                    fontSize: 30,
                  ),
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Highlights', context),
      body: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.deepPurple[400]),
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () => getInstaData(),
          child: FutureBuilder(
            future: getInstaData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x1F8A959E),
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 5),
                            ]),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: <Widget>[
                              // Container(
                              //   height: MediaQuery.of(context).size.height * 0.2,
                              //   width: MediaQuery.of(context).size.width * 0.5,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(20),
                              //     image: DecorationImage(
                              //       image: NetworkImage(snapshot.data[index].mediaUrl),
                              //       fit: BoxFit.contain,
                              //     ),
                              //   ),
                              // ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.network(
                                    snapshot.data[index].mediaUrl),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.heart,
                                        color: Colors.deepPurple[400],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(snapshot.data[index].likeCount
                                          .toString()),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  Row(
                                    children: <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.commentDots,
                                        color: Colors.deepPurple[400],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        snapshot.data[index].commentsCount
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.deepPurple,
                                    ),
                                    tooltip: 'Open Instagram',
                                    onPressed: () {
                                      launchURL(snapshot.data[index].permalink);
                                    },
                                  )
                                ],
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
                );
              }
              return Container(
                child: Center(
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(accentColor: Colors.deepPurple[400]),
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
