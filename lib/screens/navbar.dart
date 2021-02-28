import 'package:flutter/material.dart';
import 'package:stagetime/screens/artist/artist_feed.dart';
import 'package:stagetime/screens/authenticate/settings.dart';
import 'package:stagetime/screens/event/eventpage.dart';

class NavBar extends StatefulWidget {
  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<NavBar> {
  int _currentIndex = 0;
  final tabs = [
    Center(child: Artist()),
    Center(child: EventsPage()),
    Center(child: Text('Upload anything new')),
    Center(child: Text('Notifications')),
    Center(child: Settings()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.face), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
