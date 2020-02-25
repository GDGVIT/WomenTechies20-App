import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  Header(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 28,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
