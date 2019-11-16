import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedImage extends StatelessWidget {
  final String image;

  ExpandedImage(this.image);

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
        backgroundColor: Colors.black,
      ),
      body: new Container(
        color: Colors.black,
        alignment: Alignment(0.0, 0.0),
        child: new Image.network(
          image,
        ),
      ),
    );
  }
}
