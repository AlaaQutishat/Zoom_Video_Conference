import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoommetting/Variables.dart';

import 'ProfileScreen.dart';
import 'VideoConferenceScreen.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page=0;
  List pageOption=[
    VideoConferenceScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: myStyel(17,Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle:myStyel(17,Colors.black),
        currentIndex: page,
        onTap: (index){
          setState(() {
            page=index;
          });
        },
        items: [
             BottomNavigationBarItem(
                 title: Text("Video Call"),
                 icon:Icon(Icons.video_call,size: 32,)),
          BottomNavigationBarItem(
              title: Text("Profile"),
              icon:Icon(Icons.person,size: 32,))
        ],
      ),
      body: pageOption[page]
    );
  }
}
