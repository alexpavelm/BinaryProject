import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class EventObject {

  final String title;
  final String images;
  final Timestamp date;
  final String text;
  final DocumentReference reference;

  // Data taken from database about cities
  EventObject.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['images'] != null),
        assert(map['date'] != null),
        assert(map['text'] != null),
        title = map['title'],
        images = map['images'],
        date = map['date'],
        text = map['text'];

  EventObject.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}