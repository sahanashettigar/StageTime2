import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stagetime/models/user.dart';
import 'package:stagetime/screens/authenticate/authenticate.dart';
// import 'package:stagetime/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user =Provider.of<UserModel>(context);
    if (user == null){
      return Authenticate();
    }
    //  else {
    //   return Home();
    // }
    

    //return Home or authentication widget
    return Authenticate();
  }
}