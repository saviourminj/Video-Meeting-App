import 'package:flutter/material.dart';
import 'package:flutter_zoom/authentication/navigate_auth_screen.dart';
import 'package:flutter_zoom/constants.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // introduction screen is the packager we installed
      onDone: () {
        print('DONE');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NavigateAuthScreen(),
          ),
        );
      },
      onSkip: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      showSkipButton: true,
      done: Text(
        'DONE',
        style: myStyle(18),
      ),
      skip: Icon(
        Icons.skip_next,
        size: 30,
      ),
      next: Icon(Icons.arrow_forward),
      pages: [
        PageViewModel(
          title: 'Welcome',
          body: 'Meeting , Enjoy Amazing video and audio Quality',
          image: Center(
              child: Image.asset(
            'images/welcome.png',
            height: 175,
          )),
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20),
            titleTextStyle: myStyle(20),
          ),
        ),
        PageViewModel(
          title: 'Welcome',
          body: 'Easy to use Interface, join or start meeting in Real Time',
          image: Center(
              child: Image.asset(
            'images/conference.png',
            height: 230,
          )),
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20),
            titleTextStyle: myStyle(20),
          ),
        ),
        PageViewModel(
          title: 'Security',
          body: 'Your meeting privacy is our top priority',
          image: Center(
              child: Image.asset(
            'images/secure.jpg',
            height: 200,
            fit: BoxFit.fitWidth,
          )),
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20),
            titleTextStyle: myStyle(20),
          ),
        ),
        PageViewModel(
          title: 'Made By :-',
          body: 'Saviour Viyadis Minj',
          image: Center(
              child: Image.asset(
            'images/saviour.png',
            height: 210,
          )),
          decoration: PageDecoration(
            bodyTextStyle: myStyle(20),
            titleTextStyle: myStyle(20),
          ),
        ),
      ],
    );
  }
}
