import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EasterEgg extends StatefulWidget {
  @override
  _EasterEggState createState() => _EasterEggState();
}

class _EasterEggState extends State<EasterEgg> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: ()=>Fluttertoast.showToast(msg: "Are you feeling lucky?"),
                onDoubleTap: ()=>Fluttertoast.showToast(msg: "Stop it now, that\'s enough."),
                onLongPress: (){
                  setState(() {
                    isVisible = true;
                  });
                },
                child: Image.asset("assets/core/magicalduck.webp"),
              ),
              Visibility(
                visible: isVisible,
                child: Image.asset("assets/core/nikal.webp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
