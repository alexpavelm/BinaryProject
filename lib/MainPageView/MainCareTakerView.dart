import 'dart:async';

import 'package:binary_project/Chart/Chart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Global.dart';

class MainCareTakerView extends StatefulWidget {
  @override
  _MainCareTakerViewState createState() => _MainCareTakerViewState();
}

class _MainCareTakerViewState extends State<MainCareTakerView> {
  var global = Global();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.blue.shade200,
            Colors.deepPurple.shade100.withOpacity(.5)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('profiles').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.data.documents.firstWhere((a) => a.data['id'] == global.user).data['isRegistered']) {
                    return Column(
                      children: <Widget>[
                        welcomeWidget(),
    chartWidget(),
//            memoryWidget(),
//            feedbackWidget()
                      ],
                    );
                  } else {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          QrImage(
                            data: global.user.toString(),
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ],
                      ),
                    );
                  }
                }
              })));
  }

  chartWidget() {
    return Padding(
        padding: const EdgeInsets.only(top:4.0, left:4.0, right: 4.0),
        child: Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          child: new Chart(),
        ),
    );
  }


  welcomeWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 4.0, right: 4.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      global.profile.data['name'].toString().split(" ")[0] +
                          "\nis currently feeling\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.6),
                          fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          getIcon(global.selectedMood),
                          size: 35,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        new Container(
                          width: 15,
                        ),
                        new Text(
                          global.selectedMood,
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(.6),
                              fontSize: 23),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            DateTime.now().hour.toString() +
                                ":" +
                                DateTime.now().minute.toString() +
                                "  ",
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(.6),
                                fontSize: 18),
                          ),
                          (DateTime.now().hour > 12)
                              ? Icon(Icons.wb_sunny)
                              : Icon(FontAwesomeIcons.moon,
                                  color: Colors.black54, size: 20)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: global.profile['image'],
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                )
              ],
            ),
          ),
          elevation: 10,
        ),
      ),
    );
  }

  recommendWidget() {
    Completer<GoogleMapController> _controller = Completer();
    CameraPosition _myLocation = CameraPosition(
      target: LatLng(0, 0),
    );
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                    "Your patient's location" +
                        "this does not work im sorry",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  memoryWidget() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 10,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Row(children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  "https://girafa.ro/wp-content/uploads/2019/09/City-break-paris-2019.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 8 * 5 - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Paris trip",
                          style: TextStyle(fontFamily: 'Raleway', fontSize: 23),
                        ),
                      ],
                    ),
                    Text(
                      "Remember this? You've been here on 17 November 2018.",
                      style: TextStyle(fontFamily: 'Raleway'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "See more..",
                          style: TextStyle(
                              color: Colors.blue, fontFamily: 'Raleway'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  IconData getIcon(String data) {
    switch (data) {
      case "Great":
        return FontAwesomeIcons.laughBeam;
        break;
      case "Good":
        return FontAwesomeIcons.smile;
        break;
      case "Meh":
        return FontAwesomeIcons.meh;
        break;
      default:
        return FontAwesomeIcons.frown;
        break;
    }
  }

  feedbackWidget() {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    if (today == global.lastDay) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "Today you said you felt",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Hero(
                                    child: Icon(
                                      getIcon(global.selectedMood),
                                      size: 35,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    tag: "icon",
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          global.selectedMood,
                          style: TextStyle(fontFamily: 'Raleway'),
                        )
                      ],
                    ),
                  ]),
            ]),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "Tell us how you feel today",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 80,
                        height: 70,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    global.lastDay = today;
                                    global.selectedMood = "Great";
                                    sendMood("Great");
                                  });
                                },
                                child: Hero(
                                  child: Icon(
                                    getIcon(global.selectedMood),
                                    size: 35,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  tag: "icon",
                                ),
                              ),
                            ),
                            Text(
                              "Great",
                              style: TextStyle(fontFamily: 'Raleway'),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 80,
                        height: 70,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    global.lastDay = today;
                                    global.selectedMood = "Good";
                                    sendMood("Good");
                                  });
                                },
                                child: Hero(
                                  child: Icon(
                                    getIcon(global.selectedMood),
                                    size: 35,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  tag: "icon",
                                ),
                              ),
                            ),
                            Text(
                              "Good",
                              style: TextStyle(fontFamily: 'Raleway'),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 80,
                        height: 70,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    global.lastDay = today;
                                    global.selectedMood = "Meh";
                                    sendMood("Meh");
                                  });
                                },
                                child: Hero(
                                  child: Icon(
                                    getIcon(global.selectedMood),
                                    size: 35,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  tag: "icon",
                                ),
                              ),
                            ),
                            Text(
                              "Meh",
                              style: TextStyle(fontFamily: 'Raleway'),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 80,
                        height: 70,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    global.lastDay = today;
                                    global.selectedMood = "Bad";
                                    sendMood("Bad");
                                  });
                                },
                                child: Hero(
                                  child: Icon(
                                    FontAwesomeIcons.frown,
                                    size: 35,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  tag: "icon",
                                ),
                              ),
                            ),
                            Text(
                              "Bad",
                              style: TextStyle(fontFamily: 'Raleway'),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  sendMood(String data) async {
    var f = Firestore.instance;
    var now = DateTime.now();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "lastDay",
        now.day.toString() +
            "/" +
            now.month.toString() +
            "/" +
            now.year.toString());
    await prefs.setString("mood", data);
    await f.collection("moods").add({
      'date': now.day.toString() +
          "/" +
          now.month.toString() +
          "/" +
          now.year.toString(),
      'mood': data
    });
  }

  Icon patientMood(String mood) {
    switch (mood) {
      case "bad":
        return Icon(
          FontAwesomeIcons.frown,
          size: 35,
          color: Colors.black.withOpacity(0.6),
        );
        break;
      case "good":
        return Icon(
          FontAwesomeIcons.smile,
          size: 35,
          color: Colors.black.withOpacity(0.6),
        );
        break;
      case "great":
        return Icon(
          FontAwesomeIcons.laughBeam,
          size: 35,
          color: Colors.black.withOpacity(0.6),
        );
        break;
      case "meh":
        return Icon(
          FontAwesomeIcons.meh,
          size: 35,
          color: Colors.black.withOpacity(0.6),
        );
        break;
    }
  }
}
