import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryCard extends StatelessWidget {
   static double cardWidth = 250;
   static double cardHeight = 250;
   String imageLink = "https://qwr.ro/j6MA";

  @override
  Widget build(BuildContext context) {
    // needed for positioning the year/date
    cardHeight = MediaQuery.of(context).size.height;

    return Container(
      width: cardWidth,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Image.network(
                imageLink,
                alignment: new Alignment(-1, 0),
//                width: cardWidth,
                height: 125,
                fit:BoxFit.fill

              ),
              new Text(
                "that time i did a slam dunk",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),
              ),
              new Text(
                "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "wow you really can't remember can u"
                    "",
                style: new TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 12,
                  color: Colors.black,
                )
              )
            ],
          ),
        ),
        elevation: 10,
      ),
    );
  }
}
