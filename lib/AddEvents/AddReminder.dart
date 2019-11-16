import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final titleControler = TextEditingController();
  final descriptionControler = TextEditingController();
  final timeControler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text("Add reminder",
            style: TextStyle(
              fontFamily: 'raleway',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Column(
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
                  hintText: 'Enter title of reminder',
                  labelText: 'Title of reminder'),
              controller: titleControler,
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
                  hintText: 'Describe the reminder',
                  labelText: 'Description'),
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
                  hintText: 'When does it need to be done?',
                  labelText: 'Hour'),
              controller: descriptionControler,
              style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: RaisedButton(
              onPressed: () {},
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
    );
  }
}
