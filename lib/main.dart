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
          if(true) {
            return BottomNavBar();
          } else {
            return LandingView();
          }
        },
        future: global.userID,),
      ),
    );
  }
}
