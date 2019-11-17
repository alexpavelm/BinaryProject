import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Global.dart';
import '../LoadingView.dart';
import '../RegisterView.dart';

var global = Global();

class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return global.careTaker == null ? Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontFamily: 'Raleway', color: Colors.black87, fontSize: 35, fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35 , left: 40, right: 40),
              child: Text("Keep track of your daily activities and never miss out on the important things in life.",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                ),),
            ),

            RaisedButton(
              padding: const EdgeInsets.only(left: 50, right: 50),
              splashColor: Colors.deepPurple,
              elevation: 5,
              child: Text(
                "I am a pacient",
                style: TextStyle(fontFamily: 'Raleway', color: Colors.deepPurple,fontSize: 17),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.deepPurple)),
              onPressed: () {
                setState(() {
                  global.careTaker = false;
                  setCareTaker(false);
                });
              },
            ),
            RaisedButton(
              padding: const EdgeInsets.only(left: 50, right: 50),
              splashColor: Colors.deepPurple,
              elevation: 5,
              child: Text(
                "I am a caretaker",
                style: TextStyle(fontFamily: 'Raleway', color: Colors.deepPurple, fontSize: 17),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.deepPurple)),
              onPressed: () {
                setState(() {
                  global.careTaker = true;
                  setCareTaker(true);
                });
              },
            ),
          ],
        ),
      ),
    ) : RegisterView();
  }

  setCareTaker(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("careTaker", data);
  }
}