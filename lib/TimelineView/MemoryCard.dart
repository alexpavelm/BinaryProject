import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryCard extends StatelessWidget {
   final double cardWidth = 250;
   final String imageLink = "https://qwr.ro/j6MA";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
              left: 5.0,
              right: 5.0
          ),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: new Image.network(
                  imageLink,
                  alignment: new Alignment(-1, 0),
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
              new Text(
                "that time i did a slam dunk",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        elevation: 10,
      ),
    );
  }
}
