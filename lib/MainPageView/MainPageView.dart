import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Global.dart';

class MainPageView extends StatefulWidget {
  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  var global = Global();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Colors.blue.shade200,
          Colors.deepPurpleAccent.shade100.withOpacity(.5)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Column(
          children: <Widget>[
            welcomeWidget(),
            recommendWidget(),
            memoryWidget(),
            feedbackWidget()
          ],
        ),
      ),
    );
  }

  welcomeWidget() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Hey, " + global.name + "!",
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.6),
                          fontSize: 23),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        global.image,
                      )),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 330,
                  child: Text(
                    "Have you eaten your breakfast? If not, here are some suggestions:",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(.7)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 70,
                              child: Image.asset("assets/bacon.png"),
                            ),
                            Text("Bacon",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(.7))),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 70,
                              child: Image.asset("assets/pancakes.png"),
                            ),
                            Text("Pancakes",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(.7))),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
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
            CachedNetworkImage(imageUrl: "https://girafa.ro/wp-content/uploads/2019/09/City-break-paris-2019.jpg",
            placeholder: (context, url) => CircularProgressIndicator(),

          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 210,
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

  feedbackWidget() {
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
                            child: Icon(
                              FontAwesomeIcons.laughBeam,
                              size: 35,
                              color: Colors.black.withOpacity(0.6),
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
                            child: Icon(
                              FontAwesomeIcons.smile,
                              size: 35,
                              color: Colors.black.withOpacity(0.6),
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
                            child: Icon(
                              FontAwesomeIcons.meh,
                              size: 35,
                              color: Colors.black.withOpacity(0.6),
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
                            child: Icon(
                              FontAwesomeIcons.frown,
                              size: 35,
                              color: Colors.black.withOpacity(0.6),
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
