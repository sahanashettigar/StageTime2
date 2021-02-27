import 'package:flutter/material.dart';

Color myColor = Color(0xff01395e);

class Artist extends StatefulWidget {
  @override
  _ArtistState createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: new AssetImage('assets/openmic.jpeg'),
              ),
              Positioned(
                bottom: -50.0,
                child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: new AssetImage('assets/singing.jpeg')),
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          ListTile(
            title: Center(child: Text('Michelle Varghese')),
            subtitle: Center(
              child: Text(
                  'A software engineer by the day. A Musician otherwise .'),
            ),
          ),
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.message, color: Colors.blue),
            label: Text(
              'Book Artist for your show!',
              style: TextStyle(
                fontFamily: 'Roboto',
              ),
            ),
            textColor: Colors.white,
            color: myColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          ListTile(
            title: Text('About me'),
            subtitle: Text(
                "Hey! I'm michelle from PESU. Im a musician and a choir singer. I'm extremely passionate about music and learning instruments. I can play the guitar and keyboard. I love to perform at events. It brings me joy to watch people smile as I perform."),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.face), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: "")
      //   ],
      // ),
    );
  }
}
