import 'package:flutter/material.dart';
import 'package:stagetime/screens/authenticate/Landing_page.dart';
import 'package:stagetime/screens/navbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
  }
