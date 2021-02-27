import 'package:flutter/material.dart';

import 'Landing_page.dart';
import 'Landing_page.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myColor,
        body: Center(
          child: Container(
            // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            // width: 300.0,
            // height: 110.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.asset('assets/mosaic2.png'),
                Image.asset('assets/mic.png'),
                const SizedBox(height: 60),

                // SvgPicture.asset(miclogo),
                RaisedButton(
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(fontSize: 32),
                    ),
                    textColor: Colors.white,
                    color: Color(0xff275F84),
                    onPressed: () async {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      }
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 140.0, vertical: 17),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                    )
                    // shape: new RoundedRectangleBorder(
                    //   borderRadius: new BorderRadius.circular(30.0),
                    ),
                const SizedBox(height: 25),
              ],
            ),
//                 child: Text(
//                   'SIGN IN',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 textColor: Colors.white,
//                 color: Color(0xff275F84),
//                 shape: new RoundedRectangleBorder(
//                   borderRadius: new BorderRadius.circular(30.0),
//                 ),
//                 onPressed: () async {})));
          ),
        ));
  }
}
