import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addmemory extends StatefulWidget {
  @override
  _AddmemoryState createState() => _AddmemoryState();
}

class _AddmemoryState extends State<Addmemory> {
  final titleControler = TextEditingController();
  final descriptionControler = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleControler.dispose();
    descriptionControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text("Add memory to timeline"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: const BorderSide()
                  ),
                  hintText: 'Enter title',
                  labelText: 'Title of event'),
              controller: titleControler,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'raleway'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: const BorderSide()
                  ),
                  hintText: 'Describe the event in a few words...',
                  labelText: 'Description'),
              controller: descriptionControler,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'raleway'
              ),
            ),
          ),
          Text('POZA ALEX MS'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: const BorderSide()
                  ),
                  hintText: 'Enter tags',
                  labelText: 'Tag list'),
              controller: titleControler,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'raleway'
              ),
            ),
          ),
        ],
      ),
    );
  }
}
