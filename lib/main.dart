import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BottomNavBar.dart';
import 'Global.dart';
import 'LandingView/LandingView.dart';
import 'LoadingView.dart';
import 'MainPageView/MainPageView.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return LandingView();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getLocalData(),)
      ),
    );
  }

  Future getLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> data = (prefs.getString('lastDay') ?? "15/05/2019").split("/");
    global.careTaker = (prefs.getBool('careTaker') ?? null);
    global.user = (prefs.getInt('user') ?? 0);
    global.selectedMood = (prefs.getString('mood') ?? "Good");
    global.lastDay = DateTime(int.parse(data[2]), int.parse(data[1]), int.parse(data[0]));
    return global.careTaker;
  }

}
