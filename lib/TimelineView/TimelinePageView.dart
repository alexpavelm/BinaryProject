import 'package:binary_project/DataObjects/EventObject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';
import 'MemoryCard.dart';

class TimelinePageView extends StatefulWidget {
  @override
  _TimelinePageViewState createState() => _TimelinePageViewState();
}

class _TimelinePageViewState extends State<TimelinePageView> {
  final FirebaseStorage storage = FirebaseStorage(
      app: Firestore.instance.app,
      storageBucket: 'gs://binaryapp-79f95.appspot.com/');
  final double cardHeight = 180;

  final String pageTitle = "Your memory timeline";
  var global = Global();

  final DateTime my_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: new Text(
            pageTitle,
          style: new TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Colors.blue.shade200,
              Colors.deepPurpleAccent.shade100.withOpacity(.5)
            ],
            begin: Alignment.topRight, end: Alignment.bottomLeft)
        ),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('events').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        global.events = snapshot.data.documents;
        return buildList(global.events);
      },
    );
  }

  Widget buildList(List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(bottom:50),
      children: snapshot.map((data) => buildItem(EventObject.fromSnapshot(data))).toList(),
    );
  }

  Widget buildItem(EventObject event) {
    return Center(
      child: new Stack(
        children: <Widget>[
          // the actual memory card
          new Padding(
            padding: const EdgeInsets.only(top: 20, left:70),
            child: new MemoryCard(event),
          ),
          new Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 25.0,
            child: new Container(
              height: double.infinity,
              width: 1.0,
              color: Colors.white,
            ),
          ),
          // date
          new Positioned(
            top: cardHeight/2,
            left: 0.0,
            child: new Container(
              height: 58.0,
              width: 58.0,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(29.0),
                color: Colors.deepPurple.shade400.withOpacity(0.8),
              ),
              child: new Container(
                margin: new EdgeInsets.all(1.0),
                height: 58.0,
                width: 58.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: new Text(
                  getDate(event.date.split("/")),
                textAlign: TextAlign.center ,
                    style: TextStyle(
                      color: Colors.deepPurple.shade400,
                      fontWeight: FontWeight.bold,
                    )
                ),
                alignment: new Alignment(0.0, 0.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  String getDate(List<String> date) {
    String myDate = date[0] + "\n";
    switch(date[1]) {
      case "01":
        myDate += "jan";
        break;
      case "02":
        myDate += "feb";
        break;
      case "03":
        myDate += "mar";
        break;
      case "04":
        myDate += "apr";
        break;
      case "05":
        myDate += "may";
        break;
      case "06":
        myDate += "june";
        break;
      case "07":
        myDate += "july";
        break;
      case "08":
        myDate += "aug";
        break;
      case "09":
        myDate += "sept";
        break;
      case "10":
        myDate += "oct";
        break;
      case "11":
        myDate += "nov";
        break;
      case "12":
        myDate += "dec";
        break;
    }
    return myDate + "\n" + date[2];
  }
}
