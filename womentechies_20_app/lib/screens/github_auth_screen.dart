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
      // cookieString = +cookieString;
      // print("stored");
      // cookieString = cookieString.substring(0, cookieString.length);
      print(cookieString);
      // cookieString = cookieString + "\"";
      // print(cookieString);
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
        "cookie": "user=" + "\"" + cookieString,
      });
      if (response.statusCode == 200) {
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
