import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsCutsom {
  Future<String> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'email';
    String value = prefs.getString(key);
    return value;
  }

  setUserEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'email';
    prefs.setString(key, value);
  }

  Future<bool> getIfLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'logged in';
    bool value = prefs.getBool(key);
    return value;
  }

  setIfLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'logged in';
    prefs.setBool(key, value);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    return prefs.getString(key);
  }

  setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'token';
    prefs.setString(key, value);
  }

  Future<bool> getIfGithubAuthenticated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'github';
    return prefs.getBool(key);
  }
  setIfGithubAuthenticated(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'github';
    prefs.setBool(key, value);
  }

  Future<String> getGitCookie() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'gitCookie';
    return prefs.getString(key);
  }
  setGitCookie(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'gitCookie';
    prefs.setString(key, value);
  }
  Future<bool> getHasRepoData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'hasRepo';
    return prefs.getBool(key);
  }
  setHasRepoData(bool value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = 'hasRepo';
    prefs.setBool(key, value);
  }
}
