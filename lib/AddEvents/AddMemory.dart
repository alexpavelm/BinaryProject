import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addmemory extends StatefulWidget {
  @override
  _AddmemoryState createState() => _AddmemoryState();
}

class _AddmemoryState extends State<Addmemory> {
  final titleControler = TextEditingController();
  final descriptionControler = TextEditingController();
  final tagControler = TextEditingController();

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
        title: Text(
          "Add memory to timeline",
          style: TextStyle(
            fontFamily: 'raleway',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
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
                  hintText: '',
                  labelText: 'Title of event'),
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
                  labelText: 'Description'),
              controller: descriptionControler,
              style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
            ),
          ),
          Text('POZA ALEX MS'),
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
                  labelText: 'Tag list'),
              controller: tagControler,
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
                child: Text('Add memory',
                    style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
