import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Task {

  final String title;
  final String description;
  final String date;
  final DocumentReference reference;
  bool isDone;

  // Data taken from database about cities
  Task.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['date'] != null),
        assert(map['description'] != null),
        assert(map['isDone'] != null),
        title = map['title'],
        isDone = map['isDone'],
        date = map['date'],
        description = map['description'];

  Task.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}