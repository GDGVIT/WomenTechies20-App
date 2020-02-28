import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
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

  bool isAuthenticed = false;
  final SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();
  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  final String url = 'http://dscinfo.herokuapp.com/oauth';
  @override
  void initState() {
    // checkAuthentication();
    super.initState();
  }

  checkAuthentication() {
    sharedPrefsCutsom.getIfGithubAuthenticated().then((value) {
      setState(() {
        isAuthenticed = value;
        if (value == null) {
          isAuthenticed = false;
        }
      });
    });
  }

  _submitData() {
    final username = usernameController.text;
    final repoName = repoController.text;
    if (username.isEmpty || repoName.isEmpty) {
      return;
    } else {
      getInfo(username, repoName);
    }
  }

  getInfo(String username, String repoName) async {
    try {
      // print(ok);
      final url =
          'http://dscinfo.herokuapp.com/json/analyze?org=$username&repo=$repoName';
      // print(url);
      // print(ok.runtimeType);
      String cookieString = await sharedPrefsCutsom.getGitCookie();
      // cookieString = +cookieString;
      // print("stored");
      cookieString = cookieString.substring(1,cookieString.length-3);
      cookieString = cookieString + "\"";
      print(cookieString);
      // print("def");
      // print("\"2|1:0|10:1582822241|4:user|280:eyJhdmF0YXJfdXJsIjogImh0dHBzOi8vYXZhdGFyczMuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3UvMzk4NTYwMzQ/dj00IiwgImVtYWlsIjogbnVsbCwgImlkIjogMzk4NTYwMzQsICJuYW1lIjogIlNpZGRoYXJ0aGEgVmFybWEiLCAibG9naW4iOiAiQlJPMzg4NiIsICJhY2Nlc3NfdG9rZW4iOiAiMjVkNDJhODdiMmMwZDNiMGExYmY0MDgxOTIxZTk4ZTAwMWNkMDNiNCJ9|5fcad75d4ed6c71656999c495ce5863d9e46bb09d8d96b5181afb866326f2e17\"");
      // if(cookieString == "\"2|1:0|10:1582822241|4:user|280:eyJhdmF0YXJfdXJsIjogImh0dHBzOi8vYXZhdGFyczMuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3UvMzk4NTYwMzQ/dj00IiwgImVtYWlsIjogbnVsbCwgImlkIjogMzk4NTYwMzQsICJuYW1lIjogIlNpZGRoYXJ0aGEgVmFybWEiLCAibG9naW4iOiAiQlJPMzg4NiIsICJhY2Nlc3NfdG9rZW4iOiAiMjVkNDJhODdiMmMwZDNiMGExYmY0MDgxOTIxZTk4ZTAwMWNkMDNiNCJ9|5fcad75d4ed6c71656999c495ce5863d9e46bb09d8d96b5181afb866326f2e17\""){
      //   print("true");
      // }else{
      //   print("false");
      // }
      // print(cookieString);
      // print("\"user="+cookieString);
      final response = await http.get(url, headers: {
        "content-type": "application/json",
        "cookie": "user="+cookieString
      });
      if (response.statusCode == 200) {
        final client = clientFromJson(response.body);
        print(client);
        print(client.gitinspector.repository.empty);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('GitHub', context),
        body: Theme(
          data:
              Theme.of(context).copyWith(primaryColor: Colors.deepPurple[400],),
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
                                    sharedPrefsCutsom.setGitCookie(cookies["\"user"]);
                                  },
                                );
                                flutterWebviewPlugin.close();
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
              } else if (snapshot.data == true) {
                return Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: usernameController,
                          onSubmitted: (_) => _submitData,
                          decoration: InputDecoration(
                            labelText: 'GitHub Username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: repoController,
                          onSubmitted: (_) => _submitData,
                          decoration: InputDecoration(
                            labelText: 'Repo Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          color: Colors.deepPurple[400],
                          child: Text(
                            'Submit',
                            style: btnText,
                          ),
                          onPressed: _submitData,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}
