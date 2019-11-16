import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MemoryCard.dart';

class TimelinePageView extends StatelessWidget {
  final double cardHeight = 180;
  final String pageTitle = "Your memories";
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
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: new Stack(
                children: <Widget>[
                  // the actual memory card
                  new Padding(
                    padding: const EdgeInsets.only(top: 20, left:70),

                      child: new MemoryCard(),
                  ),
                  // date
                  new Positioned(
                    top: cardHeight/2,
                    left: 0.0,
                    child: new Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(25.0),
                        color: Colors.deepPurple.shade400.withOpacity(0.8),
                      ),
                      child: new Container(
                        margin: new EdgeInsets.all(1.0),
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: new Text(
                            "2019",
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
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
