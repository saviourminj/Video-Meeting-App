import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter_zoom/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName, email, passWord;
  bool dataIsThere = false;
  TextEditingController updatedUsername = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUserData();
  }
  FirebaseAuth auth = FirebaseAuth.instance;
  void getUserData() async {

    DocumentSnapshot userDoc =
        await userCollection.doc(auth.currentUser.uid).get();
    setState(() {
      userName = userDoc.data()['username'];
      email = userDoc.data()['email'];
      dataIsThere = !dataIsThere;
    });
  }

  updateProfileDialog() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    userCollection.doc(auth.currentUser.uid).update({
      'username' : updatedUsername.text
    });
    setState(() {
      userName = updatedUsername.text;
    });
    Navigator.pop(context);
  }

  openEditProfileDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              height: 200,
              child: Column(
                children: <Widget>[
                  TextField(
                    onTap: () => updatedUsername.clear(),
                    controller: updatedUsername,
                    style: myStyle(15,Colors.black,FontWeight.w500),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter New User Name',
                      labelText: 'Update Username'
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     updateProfileDialog();
                    },
                    child: Container(
                      margin: EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradientColors.juicyOrange)),
                      child: Center(
                          child: Text(
                            'Update Now!',
                            style: myStyle(15, Colors.black, FontWeight.w700),
                          )),
                    ),
                  )

                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: !dataIsThere
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: GradientColors.lightBlue),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2 - 64,
                    top: MediaQuery.of(context).size.height / 4,
                  ),
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png'),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        userName.toUpperCase(),
                        style: myStyle(40),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          openEditProfileDialog();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 18,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradientColors.purplePink)),
                          child: Center(
                              child: Text(
                            'Edit Profile',
                            style: myStyle(20, Colors.white, FontWeight.w700),
                          )),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          auth.signOut();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 18,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradientColors.juicyOrange)),
                          child: Center(
                              child: Text(
                                'Logout',
                                style: myStyle(20, Colors.white, FontWeight.w700),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
