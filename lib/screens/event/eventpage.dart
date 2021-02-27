import 'package:flutter/material.dart';
import 'package:stagetime/screens/event/body.dart';

Color myColor = Color(0xff01395E);

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: Image.asset('assets/mic.png'),
      //   backgroundColor: myColor,
      //   toolbarOpacity: 0.3,
      // ),
      body: Body(),
    );
  }
}
