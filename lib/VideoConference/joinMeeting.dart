import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_zoom/constants.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController roomCode = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  String userName='';
  joinMeeting() async{
    try{
      Map<FeatureFlagEnum,bool> featureFlag = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED : false,
      };
      if(Platform.isAndroid){
        featureFlag[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      }else if(Platform.isIOS){
        featureFlag[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      var options = JitsiMeetingOptions()
      ..room = roomCode.text
      ..userDisplayName = nameController.text == '' ? userName : nameController.text
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlag);

      await JitsiMeet.joinMeeting(options);
    }catch(error){
      print(error.toString());
    }
  }

  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    DocumentSnapshot userDoc =
    await userCollection.doc(auth.currentUser.uid).get();
    setState(() {
      userName = userDoc.data()['username'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Text(
                'Room Code',
                style: myStyle(20),
              ),
              SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                length: 6,
                controller: roomCode,
                autoDisposeControllers: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(shape: PinCodeFieldShape.underline),
                animationDuration: Duration(milliseconds: 500),
                onChanged: (code) {},
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (value) {
                 setState(() {
                   isAudioMuted = value;
                 });
                },
                activeColor: Colors.blue,
                checkColor: Colors.white,
                title: Text('Mute Video'),
              ),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (value) {
                  setState(() {
                    isVideoMuted = value;
                  });
                },
                activeColor: Colors.blue,
                checkColor: Colors.white,
                title: Text('Mute Audio'),
              ),
              Divider(
                thickness: 2,
                color: Colors.black54,
                indent: MediaQuery.of(context).size.width/60,
                endIndent: MediaQuery.of(context).size.width/60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('You can customized audio setting while in meeting',style: myStyle(13),),
              ),
              Divider(
                thickness: 2,
                indent: MediaQuery.of(context).size.width/60,
                color: Colors.black54,
                endIndent: MediaQuery.of(context).size.width/60,
              ),
              InkWell(
                onTap: () => joinMeeting(),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.of(context).size.height/18,
                  width:  double.maxFinite,
                  decoration:BoxDecoration(
                    gradient: LinearGradient(colors: MoreGradientColors.azureLane)
                  ),
                  child: Center(child: Text('Join Meeting',style: myStyle(17,Colors.black87,FontWeight.w800),)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
