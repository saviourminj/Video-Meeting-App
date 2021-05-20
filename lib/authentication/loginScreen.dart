import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
            width: MediaQuery
                .of(context)
                .size
                .width,
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 1.7,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter your Registered Email'
                        ),
                      ),
                      TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: hidden,
                        decoration: InputDecoration(
                            prefixIcon: Icon(hidden ? Icons.lock_outline : Icons
                                .lock_open),
                            hintText: 'Enter your Password',
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                              child: Icon(hidden ? Icons.visibility : Icons
                                  .visibility_off),
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          try{
                            int count = 0;
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text.trim(), password: passwordController.text.trim());
                            Navigator.popUntil(context, (route) {
                              return count++ == 2;
                            });
                          }
                          on FirebaseAuthException catch(error){
                            print(error);
                            SnackBar snackBar = SnackBar(content: Text(error.toString()));
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                        },
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 14,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 3,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              gradient: LinearGradient(
                                  colors: GradientColors.beautifulGreen),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Text('Sign In', style: myStyle(
                              25, Colors.white, FontWeight.w700))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
