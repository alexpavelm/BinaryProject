import 'package:flutter/cupertino.dart';

class ToDo {
  String title;
  String description;
  bool isDone = false;

  var time;
  DateTime now = DateTime.now();

  ToDo(this.title, this.description, hour, minute) {
    time = new DateTime(now.year, now.month, now.day, hour, minute);
  }
}
