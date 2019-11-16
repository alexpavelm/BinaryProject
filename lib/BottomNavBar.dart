import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Global.dart';
import 'MainPageView/MainPageView.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    MainPageView(),
    Center(child: Text("Second view")),
    Center(child: Text("Third view"))
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: new Scaffold(
          body: TabBarView(children: _children), // new
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.globeAmericas),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.clipboardList),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.questionCircle),
              )
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
