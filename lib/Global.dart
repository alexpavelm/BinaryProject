import 'package:binary_project/DataObjects/EventObject.dart';
import 'package:binary_project/LandingView/LandingView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Global {
  static final Global _singleton = Global._internal();

  factory Global() {
    return _singleton;
  }

  Global._internal();
  List<DocumentSnapshot> events;
  List<DocumentSnapshot> moods;
  List<DocumentSnapshot> tasks;

  Future userID;
  bool careTaker;
  bool isRegistered = false;
  DocumentSnapshot profile;
  int user = 0;
  DateTime lastDay = DateTime(2019, 11, 16);
  String selectedMood = "Bad";
  EventObject recommendedEvent;
}