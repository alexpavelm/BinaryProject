import 'package:binary_project/TimelineView/MemoryCard.dart';
import 'package:binary_project/TimelineView/TimelinePageView.dart';
import 'package:binary_project/ProfilePage/ProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AddEvents/AddMemory.dart';
import 'AddEvents/AddReminder.dart';
import 'Global.dart';
import 'MainPageView/MainPageView.dart';
import 'MainPageView/MainCareTakerView.dart';
import 'ProfilePage/ProfilePage.dart';
import 'Tasks/ToDoList.dart';
import 'package:unicorndial/unicorndial.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  static var global = Global();
  final List<Widget> _children = [
    (global.careTaker == true)?MainPageView():MainCareTakerView(),
    ToDoList(),
    TimelinePageView(),
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
          floatingActionButton: UnicornDialer(
            parentButtonBackground: Colors.deepPurple.shade300,
            childButtons: <UnicornButton>[
              UnicornButton(
                hasLabel: true,
                labelText: 'Add memory',
                labelColor: Colors.white,
                labelBackgroundColor: Colors.deepPurple.shade300,
                currentButton: FloatingActionButton(
                    heroTag: "Add memory",
                    child: Icon(Icons.add_a_photo),
                    backgroundColor: Colors.deepPurple.shade300,
                    mini: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addmemory()),
                      );
                    }
                ),
              ),
              UnicornButton(
                hasLabel: true,
                labelText: 'Add reminder',
                labelColor: Colors.white,
                labelBackgroundColor: Colors.deepPurple.shade300,
                currentButton: FloatingActionButton(
                    heroTag: "Add reminder",
                    child: Icon(Icons.calendar_today),
                    backgroundColor: Colors.deepPurple.shade300,
                    mini: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddEvent()),
                      );
                    }
                ),
              )
            ],
            hasBackground: false,
            hasNotch: true,
            onMainButtonPressed: () => print('Unicorn DIALER pressed'),
            parentButton: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
