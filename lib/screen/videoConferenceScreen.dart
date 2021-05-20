import 'package:flutter/material.dart';
import 'package:flutter_zoom/VideoConference/createMeeting.dart';
import 'package:flutter_zoom/VideoConference/joinMeeting.dart';
import 'package:flutter_zoom/constants.dart';

class VideoConferenceScreen extends StatefulWidget {
  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> with SingleTickerProviderStateMixin{
  TabController tabController;
  buildTabs(String name) {
    return Container(
      width: 150,
      height: 45,
      child: Card(
        color: Colors.indigo,
        child: Center(
          child: Text(
            name,
            style: myStyle(15, Colors.white, FontWeight.bold),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this); //this refers to VideoConferenceScreen
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('Meetings App',style: myStyle(20,Colors.white,FontWeight.w900),),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildTabs('Join Meetings'),
            buildTabs('Create Meetings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
          children: [
            JoinMeeting(),
            CreateMeeting(),
          ]),
    );
  }
}
