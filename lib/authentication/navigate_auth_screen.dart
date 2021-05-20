import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_zoom/authentication/loginScreen.dart';
import 'package:flutter_zoom/authentication/registerScreen.dart';
import 'package:flutter_zoom/constants.dart';

class NavigateAuthScreen extends StatefulWidget {
  @override
  _NavigateAuthScreenState createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: GradientColors.aqua),
            ),
            child: Center(
              child: Image.asset(
                'images/logo.png',
                height: 100,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.7,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print('Sign In');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/14,
                      width: MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        gradient: LinearGradient(colors: GradientColors.beautifulGreen),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Sign In',style: myStyle(25 , Colors.white , FontWeight.w700))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('Sign Up');
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height/14,
                      width: MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          gradient: LinearGradient(colors: GradientColors.cherry),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Sign Up',style: myStyle(25 , Colors.white, FontWeight.w700))),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
