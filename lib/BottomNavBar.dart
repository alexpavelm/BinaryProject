import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MainPageView/MainPageView.dart';
import 'ProfilePage/ProfilePage.dart';
import 'Tasks/ToDoList.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    MainPageView(),
    ToDoList(),
    Center(child: Text("Third view")),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: new Scaffold(
          body: TabBarView(children: _children), // new
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.home, size: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 27),
                child: Tab(
                  icon: Icon(
                    FontAwesomeIcons.tasks,
                    size: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 27),
                child: Tab(
                  icon: Icon(FontAwesomeIcons.list, size: 18),
                ),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.user, size: 18),
              ),
            ],
            labelColor: Colors.deepPurple.shade300,
            unselectedLabelColor: Colors.grey.shade400,
            indicatorColor: Colors.white,

          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.deepPurple.shade300,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
