import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

Color myColor = Color(0xff01395e);

class Artist extends StatefulWidget {
  @override
  _ArtistState createState() => _ArtistState();
}

class _ArtistState extends State<Artist> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    advancedPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });
    advancedPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;
  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
              children: children
                  .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
                  .toList()),
        )
      ],
    );
  }

  Widget _btn(IconData icon, VoidCallback onPressed) {
    return ButtonTheme(
      minWidth: 48.0,
      child: Container(
        width: 100,
        height: 45,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Icon(icon),
          color: Color(0xffff7575),
          textColor: Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.black12,
      inactiveColor: myColor,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  Widget localAudio() {
    return _tab([
      _btn(Icons.play_arrow_rounded, () => audioCache.play('office.mp3')),
      _btn(Icons.pause, () => advancedPlayer.pause()),
      slider()
    ]);
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

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
            title: Text(
              'About me',
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              "I'm extremely passionate about music and learning instruments. I can play the guitar and keyboard. It brings me joy to watch people smile as I perform.",
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              'Audio File : Top Played',
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              "You should listen to this! It sounds great!",
              textAlign: TextAlign.center,
            ),
          ),
          localAudio(),
          // DefaultTabController(
          //   length: 1,
          //   child: Scaffold(
          //       backgroundColor: Colors.teal,
          //       body: TabBarView(children: <Widget>[localAudio()])),
          // )
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
