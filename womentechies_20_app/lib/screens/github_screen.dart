import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
import 'package:womentechies_20_app/screens/github_auth_screen.dart';
import '../models/github_analyser.dart';
import 'package:womentechies_20_app/utils/styles.dart';

class GithubScreen extends StatefulWidget {
  @override
  _GithubScreenState createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController repoController = TextEditingController();

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
              top: 45,
              bottom: 20,
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: Theme.of(context).appBarTheme.textTheme.title.copyWith(
                    color: Colors.deepPurple[400],
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                  ),
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Client repo;
  bool isAuthenticed = false;
  final SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();
  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  final String url = 'http://dscinfo.herokuapp.com/oauth';
  @override
  void initState() {
    // checkAuthentication();
    sharedPrefsCutsom.setIfGithubAuthenticated(false);
    sharedPrefsCutsom.setHasRepoData(false);
    super.initState();
  }

  // checkAuthentication() {
  //   sharedPrefsCutsom.getIfGithubAuthenticated().then((value) {
  //     setState(() {
  //       isAuthenticed = value;
  //       if (value == null) {
  //         isAuthenticed = false;
  //       }
  //     });
  //   });
  // }

  void pushNextScreen(BuildContext context) async {
    repo = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => GithubAuthScreen()));
    // print(repo.gitinspector.repository.empty);
    print('hi');
    sharedPrefsCutsom.setHasRepoData(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('GitHub', context),
      body: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.deepPurple[400],
        ),
        child: FutureBuilder(
          future: sharedPrefsCutsom.getIfGithubAuthenticated(),
          builder: (context, snapshot) {
            if (snapshot.data == false || snapshot.data == null) {
              return Container(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    height: 90,
                    width: MediaQuery.of(context).size.width * 0.72,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      color: Colors.deepPurple[400],
                      child: Text(
                        'Authenticate',
                        style: btnText,
                      ),
                      onPressed: () {
                        flutterWebviewPlugin.launch(
                          url,
                          rect: new Rect.fromLTWH(
                            0.0,
                            0.0,
                            MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height,
                          ),
                        );
                        flutterWebviewPlugin.onUrlChanged.listen(
                          (String url) {
                            print(url);
                            if (url == 'http://dscinfo.herokuapp.com/token') {
                              flutterWebviewPlugin.getCookies().then(
                                (final cookies) {
                                  print(cookies["\"user"]);
                                  sharedPrefsCutsom
                                      .setGitCookie(cookies["\"user"]);
                                },
                              );
                              flutterWebviewPlugin.close();
                              pushNextScreen(context);
                              setState(
                                () {
                                  sharedPrefsCutsom
                                      .setIfGithubAuthenticated(true);
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            }
            return FutureBuilder(
              future: sharedPrefsCutsom.getHasRepoData(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Container(
                    padding: EdgeInsets.all(0),
                    // child: Text(repo.gitinspector.repository.empty),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Repo Name',
                                        style: gitStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FittedBox(
                                        child: Text(
                                            repo.gitinspector.repository.empty),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Date',
                                        style: gitStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(repo.gitinspector.reportDate.empty),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            for (int i = 0;
                                i <
                                    repo.gitinspector.changes.authors.author
                                        .length;
                                i++)
                              Container(
                                margin: EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.8,
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
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Author',
                                                style: gitStyle,
                                              ),
                                              Text(
                                                repo
                                                    .gitinspector
                                                    .changes
                                                    .authors
                                                    .author[i]
                                                    .name
                                                    .empty,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Commits',
                                                style: gitStyle,
                                              ),
                                              Text(
                                                repo
                                                    .gitinspector
                                                    .changes
                                                    .authors
                                                    .author[i]
                                                    .commits
                                                    .empty
                                                    .toString()
                                                    .substring(
                                                        0,
                                                        repo
                                                                .gitinspector
                                                                .changes
                                                                .authors
                                                                .author[i]
                                                                .commits
                                                                .empty
                                                                .toString()
                                                                .length -
                                                            2),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '% of Commits',
                                                style: gitStyle,
                                              ),
                                              Text(repo
                                                  .gitinspector
                                                  .changes
                                                  .authors
                                                  .author[i]
                                                  .percentageOfChanges
                                                  .empty
                                                  .toString()),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          CircularPercentIndicator(
                                            radius: 100,
                                            lineWidth: 10,
                                            percent: repo.gitinspector.changes.authors.author[i].percentageOfChanges.empty/100,
                                            center: Text('${repo.gitinspector.changes.authors.author[i].percentageOfChanges.empty} %'),
                                            backgroundColor: Colors.grey[100],
                                            progressColor: Colors.deepPurple[400],
                                            animation: true,
                                            animationDuration: 1000,

                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Center(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text('You have not added repo details.'),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                            color: Colors.deepPurple[400],
                            child: Text(
                              'Submit',
                              style: btnText,
                            ),
                            onPressed: () => pushNextScreen(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
