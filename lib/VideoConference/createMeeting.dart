import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_zoom/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String randomCode='_____';
  createCode() {
    setState(() {
      randomCode = Uuid().v1().substring(0,6);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'Create a Meeting Code and Share it.',
                  style: myStyle(25,Colors.black,FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60,vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Code :',
                    style: myStyle(20, Colors.black, FontWeight.w700),
                  ),
                  Text(
                    randomCode,
                    style: GoogleFonts.merriweather(
                      color: Colors.blue,
                      fontSize: 24
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                createCode();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 100),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: GradientColors.teal),
                ),
                child: Center(child: Text('Create Code',style: myStyle(17,Colors.white,FontWeight.w900),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
