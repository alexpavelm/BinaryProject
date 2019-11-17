import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BottomNavBar.dart';
import 'Global.dart';
import 'LandingView/LandingView.dart';
import 'MainPageView/MainPageView.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}
var global = Global();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureBuilder(builder: (_, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return BottomNavBar();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getProfile(),),
      ),
    );
  }

  Future getProfile() async {
    var firebase = Firestore.instance;
    global.profile = await firebase.collection("profiles").reference().document(global.user.toString()).get();
    return global.profile;
  }
}
