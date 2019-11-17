import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addmemory extends StatefulWidget {
  @override
  _AddmemoryState createState() => _AddmemoryState();
}

class _AddmemoryState extends State<Addmemory> {
  final titleControler = TextEditingController();
  final descriptionControler = TextEditingController();
  String url;

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
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                onPressed: () {
                  _pickSaveImage();
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
                        Color(0xFF7B68EE),
                        Color(0xFF4169E1),
                      ],
                    ),
                  ),
                  child: Text('Select photo',
                      style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
                ),
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
                  child: Text('Add memory',
                      style: TextStyle(fontSize: 20, fontFamily: 'raleway')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _pickSaveImage() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery, maxHeight: 360, maxWidth: 840, imageQuality: 75);
    StorageReference ref =
    FirebaseStorage.instance.ref().child(titleControler.text.replaceAll(" ", "") + ".jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);
    final StorageTaskSnapshot downloadUrl =
    (await uploadTask.onComplete);
    url = (await downloadUrl.ref.getDownloadURL());
    print(url);
  }

  void _storeData() async {
    String title = titleControler.text;
    String description = descriptionControler.text.replaceAll("\n", "\\n");
    var firestore = Firestore.instance;
    if(url != null) {
      await firestore.collection('events').add({
        'title': title,
        'text': description,
        'images': url,
        'date': Timestamp.now(),
      });
      Navigator.pop(context);
    }
  }
}
