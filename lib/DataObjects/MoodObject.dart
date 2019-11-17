import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Mood {


	final String date;
	final String mood;
	final DocumentReference reference;

	// Data taken from database about cities
	Mood.fromMap(Map<String, dynamic> map, {this.reference})
		: assert(map['date'] != null),
			assert(map['mood'] != null),
			date = map['date'],
			mood = map['mood'];

	Mood.fromSnapshot(DocumentSnapshot snapshot)
		: this.fromMap(snapshot.data, reference: snapshot.reference);

}