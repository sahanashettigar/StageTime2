import 'package:flutter/material.dart';
import 'package:stagetime/screens/authenticate/sign_in.dart';
import 'sign_up.dart';
import 'sign_up.dart';

const mosaic = 'assets/mosaic2.png';

class EventOrArtist extends StatefulWidget {
  @override
  _EventorartistState createState() => _EventorartistState();
}

Color myColor = Color(0xff01395E);

class _EventorartistState extends State<EventOrArtist> {
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
                ListTile(
                  title: Text(
                    'WHO DO YOU RESONATE WITH ?',
                    style: TextStyle(
                      color: Color(0xFFF6D48F),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                RaisedButton(
                    child: Text(
                      'ARTIST',
                      style: TextStyle(fontSize: 35),
                    ),
                    textColor: Colors.white,
                    color: Color(0xff275F84),
                    onPressed: () async {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sign_Up()),
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

                ElevatedButton(
                  child: Text(
                    '  EVENT  ',
                    style: TextStyle(fontSize: 35),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                    primary: Color(0xffffffff),
                    onPrimary: Color(0xFFFF7575),
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0, vertical: 17),
                  ),
                  onPressed: () async {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sign_Up()),
                      );
                    }
                  },
                ),
                const SizedBox(height: 40),
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
