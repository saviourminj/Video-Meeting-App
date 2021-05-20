import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom/constants.dart';
import 'package:flutter_zoom/screen/profileScreen.dart';
import 'package:flutter_zoom/screen/videoConferenceScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List screenPages = [
    VideoConferenceScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.indigo,
      //   title: Text('HomePage'),
      //   actions: <Widget>[
      //     InkWell(
      //       onTap: () {
      //         FirebaseAuth.instance.signOut();
      //       },
      //         child: Icon(Icons.exit_to_app))
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: myStyle(10),
        unselectedLabelStyle: myStyle(15,Colors.white,FontWeight.w700),
        currentIndex: page,
        onTap: (index) {
         setState(() {
           page = index;
         });
        },
        elevation: 50,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call,size: 30,),
            activeIcon: Icon(Icons.video_call,size: 40,),
            title: Text('Video Call')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 30,),
              activeIcon: Icon(Icons.person,size: 40,),
              title: Text('Profile')
          ),
        ],
      ),
      body: screenPages[page],
    );
  }
}
