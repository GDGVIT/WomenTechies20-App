import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QREaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: QrImage(
            data:
                'https://media1.giphy.com/media/tEQVq5ASc6CcM/giphy.gif',
            
          ),
        ),
      ),
    );
  }
}
