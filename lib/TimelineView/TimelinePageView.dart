import 'package:binary_project/DataObjects/EventObject.dart';
import 'package:binary_project/LandingView/LandingView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';
import 'MemoryCard.dart';

class TimelinePageView extends StatefulWidget {
  @override
  _TimelinePageViewState createState() => _TimelinePageViewState();

  static EventObject getRec(var global) {
    if(global.events != null)
      return EventObject.fromSnapshot(global.events.elementAt(3));
    else
      return null;
  }
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
        snapshot.data.documents.sort((a, b) => EventObject.fromSnapshot(a).date
            .compareTo(EventObject.fromSnapshot(b).date));
        global.events = snapshot
            .data
            .documents;
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
            left: 28.5,
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
                  getDate(event.date.toDate()),
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

  String getDate(DateTime date) {
    String myDate = date.day.toString() + "\n";
    switch(date.month.toString()) {
      case "1":
        myDate += "jan";
        break;
      case "2":
        myDate += "feb";
        break;
      case "3":
        myDate += "mar";
        break;
      case "4":
        myDate += "apr";
        break;
      case "5":
        myDate += "may";
        break;
      case "6":
        myDate += "june";
        break;
      case "7":
        myDate += "july";
        break;
      case "8":
        myDate += "aug";
        break;
      case "9":
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
    return myDate + "\n" + date.year.toString();
  }


}
