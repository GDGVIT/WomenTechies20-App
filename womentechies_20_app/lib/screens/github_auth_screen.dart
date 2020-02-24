import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';
import 'package:womentechies_20_app/utils/styles.dart';

class GithubAuthScreen extends StatefulWidget {
  static const routename = '/github-auth';

  @override
  _GithubAuthScreenState createState() => _GithubAuthScreenState();
}

class _GithubAuthScreenState extends State<GithubAuthScreen> {
  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  final SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();

  final String url = 'http://dscinfo.herokuapp.com/oauth';

  launchUrl() {
    flutterWebviewPlugin.reloadUrl(
      url,
    );
    
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    launchUrl();
  }

  @override
  void dispose() {
    flutterWebviewPlugin.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Authenticate GitHub',
          style: Theme.of(context).appBarTheme.textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
    );
  }
}
