import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class ProfileObject {

  final String name;
  final String image;
  final String birth;
  final String blood;
  final String family;
  final String address;
  final int id;
  final DocumentReference reference;

  // Data taken from database about cities
  ProfileObject.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['image'] != null),
        assert(map['birth'] != null),
        assert(map['blood'] != null),
        assert(map['family'] != null),
        assert(map['address'] != null),
        assert(map['id'] != null),
        name = map['name'],
        id = map['id'],
        image = map['image'],
        birth = map['birth'],
        family = map['family'],
        address = map['address'],
        blood = map['blood'];

  ProfileObject.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}