import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stagetime/models/user.dart';
import 'package:stagetime/screens/artist/artist_feed.dart';
import 'package:stagetime/screens/authenticate/authenticate.dart';
import 'package:stagetime/screens/event/eventpage.dart';
import 'package:stagetime/screens/home/home.dart';
import 'package:stagetime/screens/navbar.dart';
// import 'package:stagetime/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user =Provider.of<UserModel>(context);
    print("hello");

    print(user);
    if (user == null){
      return Authenticate();
    }
    else {
      return Home();
    }

    //return Home or authentication widget
  }
}