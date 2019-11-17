import 'package:binary_project/DataObjects/EventObject.dart';
import 'package:binary_project/TimelineView/ExpandedMemory.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryCard extends StatelessWidget {
  final EventObject event;
  final double cardWidth = 250;

  MemoryCard(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: new InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExpandedMemory(this.event)),
            );
        },
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 5.0,
            ),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: CachedNetworkImage(
                    imageUrl: event.images.split(",")[0],
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: new Text(
                    event.title,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 10,
      ),
    );
  }
}
