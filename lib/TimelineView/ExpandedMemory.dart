import 'package:binary_project/DataObjects/EventObject.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'ExpandedImage.dart';

class ExpandedMemory extends StatelessWidget {
  EventObject event;
  List<String> memoryImages;

  ExpandedMemory(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(
              Icons.arrow_back,
              color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.deepPurple.shade300,
        title: new Text(
          "Back to your memories",
          style: new TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
        child: fullMemory(),
      ),
    );
  }

  Widget fullMemory() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // title
              new Text(
                event.title,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                )
              ),
              new Container(
                height: 10,
              ),
              new Container(
                color: Colors.grey.withOpacity(0.8),
                alignment: Alignment.center,
//                width: 20,
                height: 0.5,
              ),
              new Container(
                height: 10,
              ),
              new Text(
                event.text+
                    event.text+
                    event.text+
                    event.text+
                    event.text+
                    event.text+
                    event.text+
                    event.text+
                    event.text+
                    event.text+
                    event.text,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Raleway',
                ),
              ),
              new Container(
                height: 10,
              ),
              new Container(
                color: Colors.grey.withOpacity(0.8),
                alignment: Alignment.center,
//                width: 20,
                height: 0.5,
              ),
              new Container(
                height: 10,
              ),
              new Text(
                "See photos from that day",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                )
              ),
              new Container(
                height: 10,
              ),
              new CarouselSlider(
                aspectRatio: 16/9,
                height: 200,
                viewportFraction: 0.85,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                items: event.images.split(",").map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: new InkWell(
                          onDoubleTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExpandedImage('$i')),
                            );
                          },
                          child: new Image.network(
                            '$i',
                          ),
                        )
                    );
                  },
                );
              }).toList(),)
            ],

          ),
        ),
        elevation: 10,
      ),
    );
  }

}
