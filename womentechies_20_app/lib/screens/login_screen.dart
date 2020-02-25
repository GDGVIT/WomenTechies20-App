import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:womentechies_20_app/models/shared_prefs_custom.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  static const routename = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  SharedPrefsCutsom sharedPrefsCutsom = SharedPrefsCutsom();
  bool isLoading = false;
  Map<String, String> userInfo = {"email": "", "password": ""};
  Future _login() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(userInfo['email']);
    print(userInfo['password']);
    final body = jsonEncode(userInfo);
    print(body);
    setState(() {
      isLoading = true;
    });
    String baseUrl = 'https://womentechies.herokuapp.com/api/user/login';
    String content;
    try {
      final response = await http.post(baseUrl, body: userInfo);
      final responseBody = response.body;
      print(responseBody);
      if (responseBody == 'Email doesnt exist') {
        content = 'You haven\'t registered yet';
      } else if (responseBody == 'Password is wrong') {
        content = 'Please enter correct password';
      }
      if (content == 'You haven\'t registered yet' ||
          content == 'Please enter correct password') {
        showDialog(
          context: context,
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text('Error'),
            content: Text(
              content,
              style: TextStyle(
                // fontWeight: FontWeight.w300,
                color: Colors.grey[600],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('TRY AGAIN'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        );
      } else {
        setState(() {
          isLoading = false;
        });
        print('info correct');
        sharedPrefsCutsom.setUserEmail(userInfo['email']);
        sharedPrefsCutsom.setIfLoggedIn(true);
        sharedPrefsCutsom.setToken(responseBody);
        print("saving token $responseBody");
        Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).viewPadding.top,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  'logo-orange.png',
                  height: 81,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'by',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'dsc-logo.png',
                      height: 50,
                    ),
                    Text(
                      'DSC ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'VIT',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[600],
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email ID',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'This field is required';
                              }
                              if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Please enter correct email';
                              }
                            },
                            onSaved: (email) => userInfo['email'] = email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == '') {
                                return 'This field is required';
                              }
                              if (value.length < 6) {
                                return 'Password length must be atleast 6 characters long';
                              }
                            },
                            onSaved: (password) =>
                                userInfo['password'] = password,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          (isLoading)
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    _login();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orange,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset(
                        'women.png',
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
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
