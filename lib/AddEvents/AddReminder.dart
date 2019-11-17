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
          ],
        ),
      ),
    );
  }
}
