import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Event {
  String name;
  String time;
  FaIcon faIcon;
  Color color;
  Event({
    @required this.name,
    @required this.time,
    @required this.faIcon,
    @required this.color,
  });
  // bool get getStatus => isactive;
}
