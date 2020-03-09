import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:womentechies_20_app/models/github_analyser.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
import 'package:womentechies_20_app/utils/styles.dart';

class GithubAuthScreen extends StatefulWidget {
  @override
  _GithubAuthScreenState createState() => _GithubAuthScreenState();
}

class _GithubAuthScreenState extends State<GithubAuthScreen> {
  final SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();
  TextEditingController usernameController = TextEditingController();
  TextEditingController repoController = TextEditingController();
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
      String middle;
      String end;
      // cookieString = +cookieString;
      // print("stored");
      // cookieString = cookieString.substring(0, cookieString.length);
      print(cookieString);
      
      if(cookieString.contains('\\')){
        cookieString = cookieString.split('\\')[1];
        middle = '';
        end = '"';
      }else{
        middle = '"';
        end = '';
      }

      print(cookieString);
      
      final response = await http.get(url, headers: {
        "content-type": "application/json",
        "cookie": "user=" + middle + cookieString + end,
      });
      if (response.statusCode == 200) {
        sharedPrefsCutsom.setGithubUsername(username);
        sharedPrefsCutsom.setGithubRepo(repoName);
        final client = clientFromJson(response.body);
        print(client);
        print(client.gitinspector.repository.empty);
        Navigator.pop(context,client);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.deepPurple[400]),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
          title: Text(
            'Enter Repo Details',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurple[400],
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: usernameController,
                    onSubmitted: (_) => _submitData,
                    decoration: InputDecoration(
                      labelText: 'GitHub Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: repoController,
                    onSubmitted: (_) => _submitData,
                    decoration: InputDecoration(
                      labelText: 'Repo Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
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
                    onPressed: _submitData,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
