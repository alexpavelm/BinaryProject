import 'package:cloud_firestore/cloud_firestore.dart';

class Global {
  static final Global _singleton = Global._internal();

  factory Global() {
    return _singleton;
  }

  Global._internal();
  List<DocumentSnapshot> events;

  Future userID;
  String name = "Mark";
  String image = "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg";
}