import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final titleControler = TextEditingController();
  final descriptionControler = TextEditingController();
  final timeControler = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleControler.dispose();
    descriptionControler.dispose();
    timeControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text("Add reminder"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Title of reminder'),
                controller: titleControler,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Description of reminder'),
                controller: descriptionControler,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintText: '',
                    labelText: 'Deadline'),
                controller: timeControler,
                style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                onPressed: () {
                  _storeData();
                },
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.all(13.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF4169E1),
                        Color(0xFF7B68EE),
                      ],
                    ),
                  ),
                  child: Text('Add reminder',
                      style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _storeData() async {
    String title = titleControler.text;
    String description = descriptionControler.text.replaceAll("\n", "\\n");
    String time = titleControler.text;
    var firestore = Firestore.instance;
    if(title != null && description != null) {
      await firestore.collection('tasks').add({
        'title': title,
        'description': description,
        'date': time,
        'isDone': false,
      });
      Navigator.pop(context);
    }
  }
}
