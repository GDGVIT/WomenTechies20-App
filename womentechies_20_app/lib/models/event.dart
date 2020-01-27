import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Event {
  TimeOfDay startime;
  TimeOfDay endtime;
  String name;
  Event({
    @required this.name,
    @required this.startime,
    this.endtime,
  });
  // bool get getStatus => isactive;
}
