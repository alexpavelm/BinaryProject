import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text("Add reminder"),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
